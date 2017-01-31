@echo off
::
:: This script will build the Freenet Windows Installer.
::
:: To build from a Windows command prompt: "build.cmd"
:: To build from a linux terminal: "wine cmd /c build.cmd"
::
:: The following files are not packed and need to be manually added before compiling:
::
:: - res\tool_ahk\Ahk2Exe.exe (AutoHotkey compiler - http://www.autohotkey.com/)
:: - res\tool_ahk\AutoHotkeySC.bin (AHK library, comes with AutoHotkey compiler)
::
:: - res\install_node\freenet.jar (Freenet jar)
:: - res\install_node\freenet-ext.jar (Freenet jar)
:: - res\install_node\seednodes.fref (Freenet seednodes file)
:: - res\install_node\bcprov-jdk15on-149.jar (Bouncycastle crypto library)
::
:: - res\install_node\plugins\JSTUN.jar (Freenet plugin jar)
:: - res\install_node\plugins\KeyUtils.jar (Freenet plugin jar)
:: - res\install_node\plugins\ThawIndexBrowser.jar (Freenet plugin jar)
:: - res\install_node\plugins\UPnP.jar (Freenet plugin jar)
:: - res\install_node\plugins\Library.jar (Freenet plugin jar)
::
:: Remember to update src\freenetinstaller\FreenetInstaller_Include_Info.inc with the latest version information.

:: If running under Wine, you should install the relevant wine-gecko MSI file where wine expects to find it.

::
:: Cleanup and prepare
::
echo +++++
echo + Preparing bin folder...

if exist bin rmdir /S /Q bin

echo + (Ignore any "not found" errors above this line (WINE bug at time of writing))

mkdir bin
cd bin

::
:: Copy various files to our bin folder
::
echo + Copying files into bin folder...

copy ..\res\tool_ahk\Ahk2Exe.exe Ahk2Exe.exe
copy ..\res\tool_ahk\AutoHotkeySC.bin AutoHotkeySC.bin
copy "..\res\tool_ahk\Unicode 32-bit.bin" "Unicode 32-bit.bin"

copy ..\res\tool_reshacker\ResHacker.exe ResHacker.exe
copy ..\res\tool_reshacker\ResHack_Resource_Icon_Freenet.ico ResHack_Resource_Icon_Freenet.ico
copy ..\res\tool_reshacker\ResHack_Resource_Manifest.txt ResHack_Resource_Manifest.txt
copy ..\res\tool_reshacker\ResHack_Script_Normal.txt ResHack_Script_Normal.txt

::
:: Patch AHK library
::
echo + Patching AHK library...

ResHacker.exe -script ResHack_Script_Normal.txt

del AutoHotkeySC.bin
move /Y AutoHotkeySC_Normal.bin AutoHotkeySC.bin

::
:: Compile non-elevated executables
::
echo + Compiling executables...
echo +++++

Ahk2Exe.exe /in "..\src\freenetlauncher\FreenetLauncher.ahk" /out "..\res\install_node\freenetlauncher.exe"
echo Compiled freenetlauncher.exe
Ahk2Exe.exe /in "..\src\freenettray\FreenetTray.ahk" /out "..\res\install_node\freenet.exe"
echo Compiled freenet.exe
Ahk2Exe.exe /in "..\src\freenetuninstaller\FreenetUninstaller.ahk" /out "..\res\install_node\freenetuninstaller.exe"
echo Compiled freenetuninstaller.exe
Ahk2Exe.exe /in "..\src\freenetinstaller\FreenetInstaller.ahk" /out "FreenetInstaller.exe"
echo Compiled FreenetInstaller.exe

::
:: Cleanup and delete files we copied into the source and move compiled .exe's to the bin folder in case we need them for something else.
::
echo +++++
echo + Cleaning up...
del Ahk2Exe.exe
del AutoHotkeySC.bin
del ResHacker.exe
del ResHacker.ini
del ResHack_Log_Normal.txt
del ResHack_Resource_Icon_Freenet.ico
del ResHack_Resource_Manifest.txt
del ResHack_Script_Normal.txt

echo + Fetching executables into bin folder
move ..\res\install_node\freenetlauncher.exe freenetlauncher.exe
move ..\res\install_node\freenet.exe freenet.exe
move ..\res\install_node\freenetuninstaller.exe freenetuninstaller.exe

echo +++++
echo + All done! Hopefully no errors above...
echo +++++

cd ..
