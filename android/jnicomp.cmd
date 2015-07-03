@echo off
setlocal
rem set PP_PATH=C:\progs\laztoapk\downloads\laz4android\fpc\2.7.1\bin\i386-win32\
set PP_PATH=C:\progs\laztoapk\downloads\fpc-android\bin\i386-win32
set ANDROID_STUFF=C:\progs\laztoapk\downloads\android-sdk-windows\tools;C:\progs\laztoapk\downloads\android-sdk-windows\platform-tools;C:\progs\ant\bin\
set NDK=C:\progs\laztoapk\downloads\android-ndk-r10d;C:\progs\laztoapk\downloads\android-ndk-r10d\toolchains\arm-linux-androideabi-4.9\prebuilt\windows-x86_64\bin\
SET APK_SDK_PLATFORM="c:\progs\laztoapk\downloads\android-sdk-windows\platforms\android-15"

PATH=%PP_PATH%;%NDK%;%ANDROID_STUFF%;%PATH%
rem cd android
rem  android update lib-project -p . --target 1
rem bash compile.sh && cd android && bash -c /bin/make
copy ..\bass-android\armeabi\libbass.so jni
copy libutekxp-armeabi.so jni
set NDK_DEBUG=1
ndk-build


