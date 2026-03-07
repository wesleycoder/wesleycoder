import ../utils/noop
import std/[json, strformat]
proc executeJS*(script: cstring) {.importc: "executeJS_C", cdecl.}
proc handleNativeMessage(msg: cstring): cstring {.exportc, cdecl.} =
  try:
    let payload = parseJson($msg)
    let event = payload["event"].str
    echo fmt"Received in NIM: {event}", payload["data"].str
    executeJS("console.log('this came from executeJS in NIM')")
    var response = %*{"event": fmt"{event}_response", "data": "hello from nim"}
    let jsonStr = $response
    result = cast[cstring](alloc0(jsonStr.len + 1))
    if jsonStr.len > 0:
      copyMem(result, jsonStr[0].unsafeAddr, jsonStr.len)
  except Exception as e:
    var errorNode = %*{"event": "error", "data": e.msg}
    let errStr = $errorNode
    result = cast[cstring](alloc0(errStr.len + 1))
    copyMem(result, cstring(errStr), errStr.len + 1)

{.used.}
{.
  emit:
    c"""
#include <jni.h>
#include <android/log.h>
#include <stdlib.h>

#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, "ManimNim", __VA_ARGS__)

extern void NimMain(void);

static JavaVM* cachedJVM = NULL;
static jobject cachedActivity = NULL;

JNIEXPORT void JNICALL Java_dev_guima_manim_MainActivity_startNimBackend(JNIEnv *env, jobject obj) {
  NimMain();
  (*env)->GetJavaVM(env, &cachedJVM);
  cachedActivity = (*env)->NewGlobalRef(env, obj);
  LOGI("Nim backend started and JVM cached!");
}

JNIEXPORT jstring JNICALL Java_dev_guima_manim_MainActivity_sendNimMessage(JNIEnv *env, jobject obj, jstring msg) {
  const char *nativeMsg = (*env)->GetStringUTFChars(env, msg, NULL);
  char *nimResult = handleNativeMessage(nativeMsg);
  (*env)->ReleaseStringUTFChars(env, msg, nativeMsg);
  jstring javaResult = (*env)->NewStringUTF(env, nimResult);
  free(nimResult);
  return javaResult;
}

void executeJS_C(char* script) {
  if (!cachedJVM || !cachedActivity) return;

  JNIEnv *env;
  int isAttached = 0;
  if ((*cachedJVM)->GetEnv(cachedJVM, (void **)&env, JNI_VERSION_1_6) == JNI_EDETACHED) {
    if ((*cachedJVM)->AttachCurrentThread(cachedJVM, &env, NULL) != 0) return;
    isAttached = 1;
  }

  jclass activityClass = (*env)->GetObjectClass(env, cachedActivity);
  jmethodID evalJsMethod = (*env)->GetMethodID(env, activityClass, "evaluateJavascript", "(Ljava/lang/String;)V");

  if (evalJsMethod) {
    jstring jScript = (*env)->NewStringUTF(env, script);
    (*env)->CallVoidMethod(env, cachedActivity, evalJsMethod, jScript);
    (*env)->DeleteLocalRef(env, jScript);
  }

  (*env)->DeleteLocalRef(env, activityClass);
  if (isAttached) (*cachedJVM)->DetachCurrentThread(cachedJVM);
}
"""
.}
