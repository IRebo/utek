REM Adjust these paths to yours
SET PATH=c:\progs\laztoapk\downloads\android-sdk-windows\tools;c:\progs\laztoapk\downloads\android-sdk-windows\platform-tools;C:\Program Files\Java\jdk1.7.0_65\bin;
SET APP_NAME=utekxp
SET ANDROID_HOME="c:\progs\laztoapk\downloads\android-sdk-windows"
SET APK_SDK_PLATFORM="c:\progs\laztoapk\downloads\android-sdk-windows\platforms\android-14"
SET APK_PROJECT_PATH=D:\projekt\myprojects2\utekxp\android
SET SDK_BUILDTOOLS=19.1.0
SET PASSWORD=testtest

mkdir %APK_PROJECT_PATH%\bin

keytool -genkey -v -keystore %APK_PROJECT_PATH%\bin\LCLDebugKey.keystore -alias LCLDebugKey -keyalg RSA -validity 10000

