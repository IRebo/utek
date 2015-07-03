LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libload2
LOCAL_SRC_FILES := load2.cpp
LOCAL_STATIC_LIBRARIES := crazy_linker
LOCAL_LDLIBS := -llog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libbass
LOCAL_SRC_FILES := libbass.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libutekxp-armeabi
LOCAL_SRC_FILES := libutekxp-armeabi.so
include $(PREBUILT_SHARED_LIBRARY)


include C:/progs/laztoapk/downloads/android-ndk-r10d/sources/android/crazy_linker/Android.mk
