// Copyright (c) 2013 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// A crazy linker test to:
// - Load a library (libfoo.so) with the linker.
// - Find the address of the "Foo" function in it.
// - Call the function.
// - Close the library.

//#include <stdio.h>
#include <crazy_linker.h>
#include <android/native_activity.h>
#include <android/log.h>

#include <errno.h>
#include <stdlib.h>

#define LOGI(...) ((void)__android_log_print(ANDROID_LOG_INFO, "load2", __VA_ARGS__))
#define LOGE(...) ((void)__android_log_print(ANDROID_LOG_ERROR, "load2", __VA_ARGS__))

//#include "test_util.h"

//typedef void (*FunctionPtr)();
typedef void (*FunctionPtr)(ANativeActivity*, void*, size_t);

void ANativeActivity_onCreate(ANativeActivity * app, void * ud, size_t udsize) {
//int main() {
  crazy_context_t* context = crazy_context_create();
  crazy_library_t* library;
  crazy_library_t* library2;

 crazy_context_add_search_path_for_address(context,
                                            reinterpret_cast<void*>(&ANativeActivity_onCreate));

    LOGI("Loaded boostrap");
  // DEBUG
  //crazy_context_set_load_address(context, 0x20000000);

  if (!crazy_library_open(&library2, "libbass.so", context)) {
    LOGE("Could not open library: %s", crazy_context_get_error(context));
    exit(1);
//    Panic("Could not open library: %s\n", crazy_context_get_error(context));
  }
    LOGI("Loaded boostrap bass in");

  // Load libfoo.so
  if (!crazy_library_open(&library, "libutekxp-armeabi.so", context)) {
    LOGE("Could not open library: %s", crazy_context_get_error(context));
    exit(1);
//    Panic("Could not open library: %s\n", crazy_context_get_error(context));
  }

    LOGI("Loaded boostrap 2");
  // Find the "Foo" symbol.
  FunctionPtr foo_func;
  if (!crazy_library_find_symbol(
           library, "ANativeActivity_onCreate", reinterpret_cast<void**>(&foo_func))) {
    LOGE("Could not find 'Foo' in libfoo.so");
    exit(1);
    //Panic("Could not find 'Foo' in libfoo.so\n");
  }
    LOGI("Loaded boostrap3");

  // Call it.
  (*foo_func)(app, ud, udsize);

    LOGI("Loaded boostrap4");

  // Close the library.
 /* printf("Closing libfoo.so\n");
  crazy_library_close(library);

  crazy_context_destroy(context);*/

}
