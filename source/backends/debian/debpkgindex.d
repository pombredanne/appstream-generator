/*
 * Copyright (C) 2016 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 3
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the license, or
 * (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this software.  If not, see <http://www.gnu.org/licenses/>.
 */

module backends.debian.debpkgindex;

import std.stdio;
import std.path;
import std.string;
import std.algorithm : remove;
import std.array : appender;
import std.conv : to;
static import std.file;

import logging;
import backends.interfaces;
import backends.debian.tagfile;
import backends.debian.debpkg;
import backends.debian.debutils;
import config;
import utils : escapeXml, isRemote;


class DebianPackageIndex : PackageIndex
{

private:
    string rootDir;
    Package[][string] pkgCache;
    bool[string] indexChanged;
    string tmpDir;

public:

    this (string dir)
    {
        this.rootDir = dir;
        if (!dir.isRemote && !std.file.exists (dir))
            throw new Exception ("Directory '%s' does not exist.".format (dir));

        auto conf = Config.get ();
        tmpDir = buildPath (conf.getTmpDir (), dir.baseName);
    }

    void release ()
    {
        pkgCache = null;
        indexChanged = null;
    }

    private void loadPackageLongDescs (DebPackage[string] pkgs, string suite, string section)
    {
        immutable enDescPath = buildPath ("dists", suite, section, "i18n", "Translation-en.%s");
        string enDescFname;

        try {
            enDescFname = downloadIfNecessary (rootDir, tmpDir, enDescPath);
        } catch (Exception e) {
            logDebug ("No long descriptions for %s/%s: %s", suite, section, e.msg);
            return;
        }

        auto tagf = new TagFile ();
        tagf.open (enDescFname);

        logDebug ("Opened: %s", enDescFname);
        do {
            auto pkgname = tagf.readField ("Package");
            auto rawDesc  = tagf.readField ("Description-en");
            if (!pkgname)
                continue;
            if (!rawDesc)
                continue;

            auto pkgP = (pkgname in pkgs);
            if (pkgP is null)
                continue;

            auto split = rawDesc.split ("\n");
            if (split.length < 2)
                continue;

            // NOTE: .remove() removes the element, but does not alter the length of the array. Bug?
            // (this is why we slice the array here)
            split = split[1..$];

            // TODO: We actually need a Markdown-ish parser here if we want to support
            // listings in package descriptions properly.
            auto description = appender!string;
            description ~= "<p>";
            bool first = true;
            foreach (l; split) {
                if (l.strip () == ".") {
                    description ~= "</p>\n<p>";
                    first = true;
                    continue;
                }

                if (first)
                    first = false;
                else
                    description ~= " ";

                description ~= escapeXml (l);
            }
            description ~= "</p>";

            (*pkgP).setDescription (description.data, "C");
        } while (tagf.nextSection ());
    }

    private string getIndexFile (string suite, string section, string arch)
    {
        immutable path = buildPath ("dists", suite, section, "binary-%s".format (arch));

        return downloadIfNecessary (rootDir, tmpDir, buildPath (path, "Packages.%s"));
    }

    private DebPackage[] loadPackages (string suite, string section, string arch)
    {
        auto indexFname = getIndexFile (suite, section, arch);
        if (!std.file.exists (indexFname)) {
            logWarning ("Archive package index file '%s' does not exist.", indexFname);
            return [];
        }

        auto tagf = new TagFile ();
        tagf.open (indexFname);
        logDebug ("Opened: %s", indexFname);

        DebPackage[string] pkgs;
        do {
            auto name  = tagf.readField ("Package");
            auto ver   = tagf.readField ("Version");
            auto fname = tagf.readField ("Filename");
            if (!name)
                continue;

            auto pkg = new DebPackage (name, ver, arch);
            pkg.filename = buildPath (rootDir, fname);
            pkg.maintainer = tagf.readField ("Maintainer");

            if (!pkg.isValid ()) {
                logWarning ("Found invalid package (%s)! Skipping it.", pkg.toString ());
                continue;
            }

            pkgs[name] = pkg;
        } while (tagf.nextSection ());

        // load long descriptions
        loadPackageLongDescs (pkgs, suite, section);

        return pkgs.values;
    }

    Package[] packagesFor (string suite, string section, string arch)
    {
        immutable id = "%s/%s/%s".format (suite, section, arch);
        if (id !in pkgCache) {
            auto pkgs = loadPackages (suite, section, arch);
            synchronized (this) pkgCache[id] = to!(Package[]) (pkgs);
        }

        return pkgCache[id];
    }

    bool hasChanges (DataStore dstore, string suite, string section, string arch)
    {
        import std.json;

        auto indexFname = getIndexFile (suite, section, arch);
        // if the file doesn't exit, we will emit a warning later anyway, so we just ignore this here
        if (!std.file.exists (indexFname))
            return true;

        // check our cache on whether the index had changed
        if (indexFname in indexChanged)
            return indexChanged[indexFname];

        std.datetime.SysTime mtime;
        std.datetime.SysTime atime;
        std.file.getTimes (indexFname, atime, mtime);
        auto currentTime = mtime.toUnixTime ();

        auto repoInfo = dstore.getRepoInfo (suite, section, arch);
        scope (exit) {
            repoInfo.object["mtime"] = JSONValue (currentTime);
            dstore.setRepoInfo (suite, section, arch, repoInfo);
        }

        if ("mtime" !in repoInfo.object) {
            indexChanged[indexFname] = true;
            return true;
        }

        auto pastTime = repoInfo["mtime"].integer;
        if (pastTime != currentTime) {
            indexChanged[indexFname] = true;
            return true;
        }

        indexChanged[indexFname] = false;
        return false;
    }
}
