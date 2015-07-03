REM Adjust these paths to yours
SET PATH=c:\progs\laztoapk\downloads\android-sdk-windows\tools;c:\progs\laztoapk\downloads\android-sdk-windows\platform-tools\;c:\progs\laztoapk\downloads\android-sdk-windows\build-tools\;c:\progs\laztoapk\downloads\laz4android\;C:\Program Files\Java\jdk1.7.0_71\bin
adb kill-server
adb uninstall com.nonamesoft.utekxp
adb install bin\utekxp.apk

pause