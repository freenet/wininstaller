
;
; Freenet Windows Installer - Include file - File installs
;
; This file contains the raw installation commands for the node files, and will be included directly
; into the installer at compile time.
;
; The FileInstall command handles both the packing (path as argument 1) and unpacking (path as
; argument 2) of the file.
;
; Remember to create any directories with FileCreateDir before doing FileInstalls to them.
;

FileCreateDir,								%_InstallDir%
FileInstall, ..\..\res\install_node\freenet.ico,			%_InstallDir%\freenet.ico
FileInstall, ..\..\res\install_node\freenetoffline.ico,			%_InstallDir%\freenetoffline.ico
FileInstall, ..\..\res\install_node\freenet.jar,			%_InstallDir%\freenet.jar
FileInstall, ..\..\res\install_node\freenet-ext.jar,			%_InstallDir%\freenet-ext.jar
FileInstall, ..\..\res\install_node\bcprov-jdk15on-154.jar,		%_InstallDir%\bcprov-jdk15on-154.jar
FileInstall, ..\..\res\install_node\freenet.exe,			%_InstallDir%\freenet.exe
FileInstall, ..\..\res\install_node\freenetlauncher.exe,		%_InstallDir%\freenetlauncher.exe
FileInstall, ..\..\res\install_node\freenetuninstaller.exe,		%_InstallDir%\freenetuninstaller.exe
FileInstall, ..\..\res\install_node\seednodes.fref,			%_InstallDir%\seednodes.fref
FileInstall, ..\..\res\install_node\README.txt,				%_InstallDir%\README.txt

FileCreateDir,								%_InstallDir%\licenses
FileInstall, ..\..\res\install_node\licenses\LICENSE.Freenet,		%_InstallDir%\licenses\LICENSE.Freenet
FileInstall, ..\..\res\install_node\licenses\LICENSE.Mantissa,		%_InstallDir%\licenses\LICENSE.Mantissa

FileCreateDir,								%_InstallDir%\plugins
FileInstall, ..\..\res\install_node\plugins\JSTUN.jar,			%_InstallDir%\plugins\JSTUN.jar
FileInstall, ..\..\res\install_node\plugins\KeyUtils.jar,		%_InstallDir%\plugins\KeyUtils.jar
FileInstall, ..\..\res\install_node\plugins\ThawIndexBrowser.jar,	%_InstallDir%\plugins\ThawIndexBrowser.jar
FileInstall, ..\..\res\install_node\plugins\UPnP.jar,			%_InstallDir%\plugins\UPnP.jar
FileInstall, ..\..\res\install_node\plugins\Library.jar,		%_InstallDir%\plugins\Library.jar
FileCreateDir,								%_InstallDir%\wrapper
FileInstall, ..\..\res\install_node\wrapper\freenetwrapper.exe,		%_InstallDir%\wrapper\freenetwrapper.exe
FileInstall, ..\..\res\install_node\wrapper\wrapper.conf,		%_InstallDir%\wrapper\wrapper.conf
FileInstall, ..\..\res\install_node\wrapper\wrapper-windows-x86-32.dll,	%_InstallDir%\wrapper\wrapper-windows-x86-32.dll
FileInstall, ..\..\res\install_node\wrapper\wrapper.jar,		%_InstallDir%\wrapper\wrapper.jar

FileCreateDir,								%_InstallDir%\updater
FileInstall, ..\..\res\install_node\updater\update.cmd,		%_InstallDir%\update.cmd
FileInstall, ..\..\res\install_node\updater\sha1test.jar,		%_InstallDir%\updater\sha1test.jar
FileInstall, ..\..\res\install_node\updater\startssl.pem,		%_InstallDir%\updater\startssl.pem
FileInstall, ..\..\res\install_node\updater\wget.exe,		%_InstallDir%\updater\wget.exe
