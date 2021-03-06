project('AppStream Generator', 'd')


asgen_sources = ['source/app.d',
    'source/zarchive.d',
    'source/bindings/cairo.d',
    'source/bindings/freetype.d',
    'source/bindings/gdkpixbuf.d',
    'source/bindings/libarchive.d',
    'source/bindings/lmdb.d',
    'source/bindings/rsvg.d',
    'source/bindings/concurrency_generator.d',
    'source/config.d',
    'source/contentsstore.d',
    'source/datastore.d',
    'source/engine.d',
    'source/extractor.d',
    'source/handlers/desktopparser.d',
    'source/handlers/iconhandler.d',
    'source/handlers/metainfoparser.d',
    'source/handlers/metainfovalidator.d',
    'source/handlers/package.d',
    'source/handlers/screenshothandler.d',
    'source/hint.d',
    'source/image.d',
    'source/logging.d',
    'source/reportgenerator.d',
    'source/result.d',
    'source/utils.d'
]

backend_sources = [
    'source/backends/archlinux/alpkg.d',
    'source/backends/archlinux/alpkgindex.d',
    'source/backends/archlinux/listfile.d',
    'source/backends/archlinux/package.d',
    'source/backends/debian/debpkg.d',
    'source/backends/debian/debpkgindex.d',
    'source/backends/debian/package.d',
    'source/backends/debian/tagfile.d',
    'source/backends/debian/debutils.d',
    'source/backends/dummy/dummypkg.d',
    'source/backends/dummy/package.d',
    'source/backends/dummy/pkgindex.d',
    'source/backends/interfaces.d',
    'source/backends/rpmmd/package.d',
    'source/backends/rpmmd/rpmpkg.d',
    'source/backends/rpmmd/rpmpkgindex.d',
]

gir_binding_sources = [
    'source/bindings/auto/appstream/Category.d',
    'source/bindings/auto/appstream/Component.d',
    'source/bindings/auto/appstream/Database.d',
    'source/bindings/auto/appstream/DataPool.d',
    'source/bindings/auto/appstream/DistroDetails.d',
    'source/bindings/auto/appstream/Icon.d',
    'source/bindings/auto/appstream/Image.d',
    'source/bindings/auto/appstream/MenuParser.d',
    'source/bindings/auto/appstream/Metadata.d',
    'source/bindings/auto/appstream/Provided.d',
    'source/bindings/auto/appstream/Release.d',
    'source/bindings/auto/appstream/Screenshot.d',
    'source/bindings/auto/appstream/Translation.d',
    'source/bindings/auto/appstream/Validator.d',
    'source/bindings/auto/appstream/ValidatorIssue.d',
    'source/bindings/auto/gi/appstream.d',
    'source/bindings/auto/gi/appstreamtypes.d',
    'source/bindings/auto/gi/gio.d',
    'source/bindings/auto/gi/giotypes.d',
    'source/bindings/auto/gi/glib.d',
    'source/bindings/auto/gi/glibtypes.d',
    'source/bindings/auto/gi/gobject.d',
    'source/bindings/auto/gi/gobjecttypes.d',
    'source/bindings/auto/gio/Action.d',
    'source/bindings/auto/gio/ActionGroup.d',
    'source/bindings/auto/gio/ActionGroupIF.d',
    'source/bindings/auto/gio/ActionGroupT.d',
    'source/bindings/auto/gio/ActionIF.d',
    'source/bindings/auto/gio/ActionMapIF.d',
    'source/bindings/auto/gio/ActionMapT.d',
    'source/bindings/auto/gio/ActionT.d',
    'source/bindings/auto/gio/AppInfo.d',
    'source/bindings/auto/gio/AppInfoIF.d',
    'source/bindings/auto/gio/AppInfoMonitor.d',
    'source/bindings/auto/gio/AppInfoT.d',
    'source/bindings/auto/gio/AppLaunchContext.d',
    'source/bindings/auto/gio/ApplicationCommandLine.d',
    'source/bindings/auto/gio/Application.d',
    'source/bindings/auto/gio/AsyncInitableIF.d',
    'source/bindings/auto/gio/AsyncInitableT.d',
    'source/bindings/auto/gio/AsyncResultIF.d',
    'source/bindings/auto/gio/AsyncResultT.d',
    'source/bindings/auto/gio/BufferedInputStream.d',
    'source/bindings/auto/gio/BufferedOutputStream.d',
    'source/bindings/auto/gio/BytesIcon.d',
    'source/bindings/auto/gio/Cancellable.d',
    'source/bindings/auto/gio/CharsetConverter.d',
    'source/bindings/auto/gio/ContentType.d',
    'source/bindings/auto/gio/Converter.d',
    'source/bindings/auto/gio/ConverterIF.d',
    'source/bindings/auto/gio/ConverterInputStream.d',
    'source/bindings/auto/gio/ConverterOutputStream.d',
    'source/bindings/auto/gio/ConverterT.d',
    'source/bindings/auto/gio/Credentials.d',
    'source/bindings/auto/gio/DatagramBasedIF.d',
    'source/bindings/auto/gio/DataInputStream.d',
    'source/bindings/auto/gio/DataOutputStream.d',
    'source/bindings/auto/gio/DBusActionGroup.d',
    'source/bindings/auto/gio/DBusAnnotationInfo.d',
    'source/bindings/auto/gio/DBusArgInfo.d',
    'source/bindings/auto/gio/DBusAuthObserver.d',
    'source/bindings/auto/gio/DBusConnection.d',
    'source/bindings/auto/gio/DBusError.d',
    'source/bindings/auto/gio/DBusInterface.d',
    'source/bindings/auto/gio/DBusInterfaceIF.d',
    'source/bindings/auto/gio/DBusInterfaceInfo.d',
    'source/bindings/auto/gio/DBusInterfaceSkeleton.d',
    'source/bindings/auto/gio/DBusInterfaceT.d',
    'source/bindings/auto/gio/DBusMenuModel.d',
    'source/bindings/auto/gio/DBusMessage.d',
    'source/bindings/auto/gio/DBusMethodInfo.d',
    'source/bindings/auto/gio/DBusMethodInvocation.d',
    'source/bindings/auto/gio/DBusNames.d',
    'source/bindings/auto/gio/DBusNodeInfo.d',
    'source/bindings/auto/gio/DBusObject.d',
    'source/bindings/auto/gio/DBusObjectIF.d',
    'source/bindings/auto/gio/DBusObjectManagerClient.d',
    'source/bindings/auto/gio/DBusObjectManagerIF.d',
    'source/bindings/auto/gio/DBusObjectManagerServer.d',
    'source/bindings/auto/gio/DBusObjectManagerT.d',
    'source/bindings/auto/gio/DBusObjectProxy.d',
    'source/bindings/auto/gio/DBusObjectSkeleton.d',
    'source/bindings/auto/gio/DBusObjectT.d',
    'source/bindings/auto/gio/DBusPropertyInfo.d',
    'source/bindings/auto/gio/DBusProxy.d',
    'source/bindings/auto/gio/DBusServer.d',
    'source/bindings/auto/gio/DBusSignalInfo.d',
    'source/bindings/auto/gio/DBusUtilities.d',
    'source/bindings/auto/gio/DesktopAppInfo.d',
    'source/bindings/auto/gio/DesktopAppInfoLookupIF.d',
    'source/bindings/auto/gio/DesktopAppInfoLookupT.d',
    'source/bindings/auto/gio/Drive.d',
    'source/bindings/auto/gio/DriveIF.d',
    'source/bindings/auto/gio/DriveT.d',
    'source/bindings/auto/gio/Emblem.d',
    'source/bindings/auto/gio/EmblemedIcon.d',
    'source/bindings/auto/gio/ErrorGIO.d',
    'source/bindings/auto/gio/FileAttributeInfoList.d',
    'source/bindings/auto/gio/FileAttributeMatcher.d',
    'source/bindings/auto/gio/File.d',
    'source/bindings/auto/gio/FileDescriptorBasedIF.d',
    'source/bindings/auto/gio/FileDescriptorBasedT.d',
    'source/bindings/auto/gio/FileEnumerator.d',
    'source/bindings/auto/gio/FileIcon.d',
    'source/bindings/auto/gio/FileIF.d',
    'source/bindings/auto/gio/FileInfo.d',
    'source/bindings/auto/gio/FileInputStream.d',
    'source/bindings/auto/gio/FileIOStream.d',
    'source/bindings/auto/gio/FileMonitor.d',
    'source/bindings/auto/gio/FilenameCompleter.d',
    'source/bindings/auto/gio/FileOutputStream.d',
    'source/bindings/auto/gio/FileT.d',
    'source/bindings/auto/gio/FilterInputStream.d',
    'source/bindings/auto/gio/FilterOutputStream.d',
    'source/bindings/auto/gio/Icon.d',
    'source/bindings/auto/gio/IconIF.d',
    'source/bindings/auto/gio/IconT.d',
    'source/bindings/auto/gio/InitableIF.d',
    'source/bindings/auto/gio/InitableT.d',
    'source/bindings/auto/gio/InputStream.d',
    'source/bindings/auto/gio/IOExtension.d',
    'source/bindings/auto/gio/IOExtensionPoint.d',
    'source/bindings/auto/gio/IOSchedulerJob.d',
    'source/bindings/auto/gio/IOStream.d',
    'source/bindings/auto/gio/ListModelIF.d',
    'source/bindings/auto/gio/ListModelT.d',
    'source/bindings/auto/gio/ListStore.d',
    'source/bindings/auto/gio/LoadableIconIF.d',
    'source/bindings/auto/gio/LoadableIconT.d',
    'source/bindings/auto/gio/MemoryInputStream.d',
    'source/bindings/auto/gio/MemoryOutputStream.d',
    'source/bindings/auto/gio/MenuAttributeIter.d',
    'source/bindings/auto/gio/Menu.d',
    'source/bindings/auto/gio/MenuItem.d',
    'source/bindings/auto/gio/MenuLinkIter.d',
    'source/bindings/auto/gio/MenuModel.d',
    'source/bindings/auto/gio/Mount.d',
    'source/bindings/auto/gio/MountIF.d',
    'source/bindings/auto/gio/MountOperation.d',
    'source/bindings/auto/gio/MountT.d',
    'source/bindings/auto/gio/NativeVolumeMonitor.d',
    'source/bindings/auto/gio/Notification.d',
    'source/bindings/auto/gio/OutputStream.d',
    'source/bindings/auto/gio/Permission.d',
    'source/bindings/auto/gio/PollableInputStreamIF.d',
    'source/bindings/auto/gio/PollableInputStreamT.d',
    'source/bindings/auto/gio/PollableOutputStreamIF.d',
    'source/bindings/auto/gio/PollableOutputStreamT.d',
    'source/bindings/auto/gio/PollableUtils.d',
    'source/bindings/auto/gio/PropertyAction.d',
    'source/bindings/auto/gio/ProxyResolver.d',
    'source/bindings/auto/gio/ProxyResolverIF.d',
    'source/bindings/auto/gio/ProxyResolverT.d',
    'source/bindings/auto/gio/RemoteActionGroupIF.d',
    'source/bindings/auto/gio/RemoteActionGroupT.d',
    'source/bindings/auto/gio/Resource.d',
    'source/bindings/auto/gio/SeekableIF.d',
    'source/bindings/auto/gio/SeekableT.d',
    'source/bindings/auto/gio/Settings.d',
    'source/bindings/auto/gio/SettingsSchema.d',
    'source/bindings/auto/gio/SettingsSchemaKey.d',
    'source/bindings/auto/gio/SettingsSchemaSource.d',
    'source/bindings/auto/gio/SimpleAction.d',
    'source/bindings/auto/gio/SimpleActionGroup.d',
    'source/bindings/auto/gio/SimpleAsyncResult.d',
    'source/bindings/auto/gio/SimpleIOStream.d',
    'source/bindings/auto/gio/SimplePermission.d',
    'source/bindings/auto/gio/SimpleProxyResolver.d',
    'source/bindings/auto/gio/SocketControlMessage.d',
    'source/bindings/auto/gio/SrvTarget.d',
    'source/bindings/auto/gio/StaticResource.d',
    'source/bindings/auto/gio/Subprocess.d',
    'source/bindings/auto/gio/SubprocessLauncher.d',
    'source/bindings/auto/gio/Task.d',
    'source/bindings/auto/gio/TestDBus.d',
    'source/bindings/auto/gio/ThemedIcon.d',
    'source/bindings/auto/gio/TlsFileDatabaseIF.d',
    'source/bindings/auto/gio/TlsFileDatabaseT.d',
    'source/bindings/auto/gio/TlsPassword.d',
    'source/bindings/auto/gio/UnixCredentialsMessage.d',
    'source/bindings/auto/gio/UnixFDList.d',
    'source/bindings/auto/gio/UnixFDMessage.d',
    'source/bindings/auto/gio/UnixInputStream.d',
    'source/bindings/auto/gio/UnixMountEntry.d',
    'source/bindings/auto/gio/UnixMountMonitor.d',
    'source/bindings/auto/gio/UnixMountPoint.d',
    'source/bindings/auto/gio/UnixOutputStream.d',
    'source/bindings/auto/gio/Vfs.d',
    'source/bindings/auto/gio/Volume.d',
    'source/bindings/auto/gio/VolumeIF.d',
    'source/bindings/auto/gio/VolumeMonitor.d',
    'source/bindings/auto/gio/VolumeT.d',
    'source/bindings/auto/gio/ZlibCompressor.d',
    'source/bindings/auto/gio/ZlibDecompressor.d',
    'source/bindings/auto/glib/ArrayG.d',
    'source/bindings/auto/glib/AsyncQueue.d',
    'source/bindings/auto/glib/Atomic.d',
    'source/bindings/auto/glib/Base64.d',
    'source/bindings/auto/glib/BBTree.d',
    'source/bindings/auto/glib/BookmarkFile.d',
    'source/bindings/auto/glib/ByteArray.d',
    'source/bindings/auto/glib/Bytes.d',
    'source/bindings/auto/glib/CharacterSet.d',
    'source/bindings/auto/glib/Checksum.d',
    'source/bindings/auto/glib/Child.d',
    'source/bindings/auto/glib/Cond.d',
    'source/bindings/auto/glib/ConstructionException.d',
    'source/bindings/auto/glib/DataList.d',
    'source/bindings/auto/glib/DataSet.d',
    'source/bindings/auto/glib/Date.d',
    'source/bindings/auto/glib/DateTime.d',
    'source/bindings/auto/glib/Directory.d',
    'source/bindings/auto/glib/ErrorG.d',
    'source/bindings/auto/glib/FileUtils.d',
    'source/bindings/auto/glib/GException.d',
    'source/bindings/auto/glib/GLib.d',
    'source/bindings/auto/glib/HashTable.d',
    'source/bindings/auto/glib/HashTableIter.d',
    'source/bindings/auto/glib/Hmac.d',
    'source/bindings/auto/glib/Hook.d',
    'source/bindings/auto/glib/HookList.d',
    'source/bindings/auto/glib/Hostname.d',
    'source/bindings/auto/glib/IConv.d',
    'source/bindings/auto/glib/Idle.d',
    'source/bindings/auto/glib/Internationalization.d',
    'source/bindings/auto/glib/IOChannel.d',
    'source/bindings/auto/glib/KeyFile.d',
    'source/bindings/auto/glib/ListG.d',
    'source/bindings/auto/glib/ListSG.d',
    'source/bindings/auto/glib/MainContext.d',
    'source/bindings/auto/glib/MainLoop.d',
    'source/bindings/auto/glib/MappedFile.d',
    'source/bindings/auto/glib/MatchInfo.d',
    'source/bindings/auto/glib/Memory.d',
    'source/bindings/auto/glib/MemorySlice.d',
    'source/bindings/auto/glib/MessageLog.d',
    'source/bindings/auto/glib/Messages.d',
    'source/bindings/auto/glib/Mutex.d',
    'source/bindings/auto/glib/Node.d',
    'source/bindings/auto/glib/Once.d',
    'source/bindings/auto/glib/OptionContext.d',
    'source/bindings/auto/glib/OptionGroup.d',
    'source/bindings/auto/glib/Pattern.d',
    'source/bindings/auto/glib/Private.d',
    'source/bindings/auto/glib/PtrArray.d',
    'source/bindings/auto/glib/Quark.d',
    'source/bindings/auto/glib/QueueG.d',
    'source/bindings/auto/glib/RandG.d',
    'source/bindings/auto/glib/RecMutex.d',
    'source/bindings/auto/glib/Regex.d',
    'source/bindings/auto/glib/RWLock.d',
    'source/bindings/auto/glib/ScannerG.d',
    'source/bindings/auto/glib/Sequence.d',
    'source/bindings/auto/glib/SequenceIter.d',
    'source/bindings/auto/glib/ShellUtils.d',
    'source/bindings/auto/glib/SimpleXML.d',
    'source/bindings/auto/glib/Source.d',
    'source/bindings/auto/glib/Spawn.d',
    'source/bindings/auto/glib/Str.d',
    'source/bindings/auto/glib/StringChunk.d',
    'source/bindings/auto/glib/StringG.d',
    'source/bindings/auto/glib/TestLogBuffer.d',
    'source/bindings/auto/glib/TestLogMsg.d',
    'source/bindings/auto/glib/TestSuite.d',
    'source/bindings/auto/glib/Thread.d',
    'source/bindings/auto/glib/ThreadPool.d',
    'source/bindings/auto/glib/Timeout.d',
    'source/bindings/auto/glib/Timer.d',
    'source/bindings/auto/glib/TimeVal.d',
    'source/bindings/auto/glib/TimeZone.d',
    'source/bindings/auto/glib/TrashStack.d',
    'source/bindings/auto/glib/Unicode.d',
    'source/bindings/auto/glib/UnixUtils.d',
    'source/bindings/auto/glib/URI.d',
    'source/bindings/auto/glib/Util.d',
    'source/bindings/auto/glib/VariantBuilder.d',
    'source/bindings/auto/glib/Variant.d',
    'source/bindings/auto/glib/VariantDict.d',
    'source/bindings/auto/glib/VariantIter.d',
    'source/bindings/auto/glib/VariantType.d',
    'source/bindings/auto/glib/Version.d',
    'source/bindings/auto/gobject/Binding.d',
    'source/bindings/auto/gobject/Boxed.d',
    'source/bindings/auto/gobject/CClosure.d',
    'source/bindings/auto/gobject/Closure.d',
    'source/bindings/auto/gobject/Enums.d',
    'source/bindings/auto/gobject/Flags.d',
    'source/bindings/auto/gobject/ObjectClass.d',
    'source/bindings/auto/gobject/ObjectG.d',
    'source/bindings/auto/gobject/ParamSpec.d',
    'source/bindings/auto/gobject/ParamSpecPool.d',
    'source/bindings/auto/gobject/Signals.d',
    'source/bindings/auto/gobject/TypeClass.d',
    'source/bindings/auto/gobject/Type.d',
    'source/bindings/auto/gobject/TypeInstance.d',
    'source/bindings/auto/gobject/TypeInterface.d',
    'source/bindings/auto/gobject/TypeModule.d',
    'source/bindings/auto/gobject/TypePlugin.d',
    'source/bindings/auto/gobject/TypePluginIF.d',
    'source/bindings/auto/gobject/TypePluginT.d',
    'source/bindings/auto/gobject/TypeValueTable.d',
    'source/bindings/auto/gobject/ValueArray.d',
    'source/bindings/auto/gobject/Value.d',
    'source/bindings/auto/gobject/WeakRef.d',
]

src_dir = gir_bind_dir = include_directories('source/')
gir_bind_dir = include_directories('source/bindings/auto')
other_include_dir = include_directories('/usr/include/d/mustache-d/src/')


asgen_exe = executable ('appstream-generator',
    [asgen_sources, backend_sources, gir_binding_sources],
    include_directories : [src_dir, gir_bind_dir, other_include_dir],
    install : true
)
#test('dlangtest', e)
