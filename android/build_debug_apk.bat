setlocal

REM Adjust these paths to yours
SET PATH=c:\progs\laztoapk\downloads\android-sdk-windows\tools;c:\progs\laztoapk\downloads\android-sdk-windows\platform-tools\;
set PATH=%PATH%;c:\progs\laztoapk\downloads\android-sdk-windows\build-tools\21.1.2\;C:\Program Files\Java\jdk1.7.0_71\bin
SET APP_NAME=utekxp
SET ANDROID_HOME="c:\progs\laztoapk\downloads\android-sdk-windows"
SET APK_SDK_PLATFORM="c:\progs\laztoapk\downloads\android-sdk-windows\platforms\android-15"
SET APK_PROJECT_PATH=D:\projekt\myprojects2\utekxp\android
SET SDK_BUILDTOOLS=21.1.2
SET PASSWORD=testtest

REM Create necessary directory Structure
mkdir %APK_PROJECT_PATH%\bin
mkdir %APK_PROJECT_PATH%\bin\classes
mkdir %APK_PROJECT_PATH%\gen
mkdir %APK_PROJECT_PATH%\gen\com
mkdir %APK_PROJECT_PATH%\gen\com\pascal
mkdir %APK_PROJECT_PATH%\gen\com\pascal\utekxp
mkdir %APK_PROJECT_PATH%\raw
mkdir %APK_PROJECT_PATH%\raw\lib
mkdir %APK_PROJECT_PATH%\raw\lib\armeabi

REM Cleanup
del %APK_PROJECT_PATH%\bin\%APP_NAME%.ap_
del %APK_PROJECT_PATH%\bin\%APP_NAME%.apk
del %APK_PROJECT_PATH%\raw\lib\armeabi\*.so

REM More directory preparation
copy %APK_PROJECT_PATH%\libs\armeabi\*.so %APK_PROJECT_PATH%\raw\lib\armeabi\

REM Resource compilation
call aapt p -v -f -A %APK_PROJECT_PATH%\..\assets -M %APK_PROJECT_PATH%\AndroidManifest.xml -F %APK_PROJECT_PATH%\bin\%APP_NAME%.ap_ -I %APK_SDK_PLATFORM%\android.jar -S res -m -J %APK_PROJECT_PATH%\gen %APK_PROJECT_PATH%\raw 
REM pause

REM Java compiler
call javac -source 1.6 -target 1.6 -verbose -encoding UTF8 -classpath %APK_SDK_PLATFORM%\android.jar -d %APK_PROJECT_PATH%\bin\classes %APK_PROJECT_PATH%\src\com\pascal\utekxp\LCLActivity.java
REM pause

REM DX to convert the java bytecode to dalvik bytecode
call java -Djava.ext.dirs=%ANDROID_HOME%\platform-tools\lib\ -jar %ANDROID_HOME%\build-tools\%SDK_BUILDTOOLS%\lib\dx.jar --dex --verbose --output=%APK_PROJECT_PATH%\bin\classes.dex %APK_PROJECT_PATH%\bin\classes
REM pause

REM It seams that dx calls echo off
@echo on
REM Now build the unsigned APK
del %APK_PROJECT_PATH%\bin\%APP_NAME%-unsigned.apk
call java -classpath %ANDROID_HOME%\tools\lib\sdklib.jar com.android.sdklib.build.ApkBuilderMain %APK_PROJECT_PATH%\bin\%APP_NAME%-unsigned.apk -v -u -z %APK_PROJECT_PATH%\bin\%APP_NAME%.ap_ -f %APK_PROJECT_PATH%\bin\classes.dex

REM pause

REM Generating on the fly a debug key

REM Signing the APK with a debug key
del %APK_PROJECT_PATH%\bin\%APP_NAME%-unaligned.apk
jarsigner -verbose -keystore %APK_PROJECT_PATH%\bin\LCLDebugKey.keystore -sigalg MD5withRSA -digestalg SHA1 -keypass %PASSWORD% -storepass %PASSWORD% -signedjar %APK_PROJECT_PATH%\bin\%APP_NAME%-unaligned.apk %APK_PROJECT_PATH%\bin\%APP_NAME%-unsigned.apk LCLDebugKey

REM Align the final APK package
zipalign -v 4 %APK_PROJECT_PATH%\bin\%APP_NAME%-unaligned.apk %APK_PROJECT_PATH%\bin\%APP_NAME%.apk

REM call and pause together allow us to see the results in the end
REM pause
