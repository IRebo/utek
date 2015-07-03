#include <android/native_activity.h>
#include <android/log.h>
#include <dlfcn.h>
#include <errno.h>
#include <stdlib.h>

#define LOGI(...) ((void)__android_log_print(ANDROID_LOG_INFO, "Porkholt", __VA_ARGS__))
#define LOGE(...) ((void)__android_log_print(ANDROID_LOG_ERROR, "Porkholt", __VA_ARGS__))

#define LIB_PATH "/data/data/@PH_BUNDLE_ID@/lib/"

void * load_lib(const char * l)
{
    void * handle = dlopen(l, RTLD_NOW | RTLD_GLOBAL);
    if (!handle)
    {
        LOGE("dlopen(\"%s\"): %s", l, strerror(errno));
        exit(1);
    }
    return handle;
}

void ANativeActivity_onCreate(ANativeActivity * app, void * ud, size_t udsize)
{
    LOGI("Loaded boostrap");
    load_lib(LIB_PATH "libbass.so");
    load_lib(LIB_PATH "liblclapp.so");
    void (*main)(ANativeActivity*, void*, size_t) = dlsym(load_lib(LIB_PATH "lib@PH_APP_TARGET@.so"), "ANativeActivity_onCreate");
    if (!main)
    {
        LOGE("undefined symbol ANativeActivity_onCreate");
        exit(1);
    }
    main(app, ud, udsize);
}
