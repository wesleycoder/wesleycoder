#include <android/log.h>
#include <jni.h>
#include <stdlib.h>

#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, "ManimNim", __VA_ARGS__)

extern void NimMain(void);

static JavaVM *cachedJVM = NULL;
static jobject cachedActivity = NULL;

JNIEXPORT void JNICALL
Java_dev_guima_manim_MainActivity_startNimBackend(JNIEnv *env, jobject obj) {
  NimMain();
  (*env)->GetJavaVM(env, &cachedJVM);
  cachedActivity = (*env)->NewGlobalRef(env, obj);
  LOGI("Nim backend started and JVM cached!");
}

JNIEXPORT jstring JNICALL Java_dev_guima_manim_MainActivity_sendNimMessage(
    JNIEnv *env, jobject obj, jstring msg) {
  const char *nativeMsg = (*env)->GetStringUTFChars(env, msg, NULL);
  char *nimResult = handleNativeMessage(nativeMsg);
  (*env)->ReleaseStringUTFChars(env, msg, nativeMsg);
  jstring javaResult = (*env)->NewStringUTF(env, nimResult);
  free(nimResult);
  return javaResult;
}

void executeJS_C(char *script) {
  if (!cachedJVM || !cachedActivity)
    return;

  JNIEnv *env;
  int isAttached = 0;
  if ((*cachedJVM)->GetEnv(cachedJVM, (void **)&env, JNI_VERSION_1_6) ==
      JNI_EDETACHED) {
    if ((*cachedJVM)->AttachCurrentThread(cachedJVM, &env, NULL) != 0)
      return;
    isAttached = 1;
  }

  jclass activityClass = (*env)->GetObjectClass(env, cachedActivity);
  jmethodID evalJsMethod = (*env)->GetMethodID(
      env, activityClass, "evaluateJavascript", "(Ljava/lang/String;)V");

  if (evalJsMethod) {
    jstring jScript = (*env)->NewStringUTF(env, script);
    (*env)->CallVoidMethod(env, cachedActivity, evalJsMethod, jScript);
    (*env)->DeleteLocalRef(env, jScript);
  }

  (*env)->DeleteLocalRef(env, activityClass);
  if (isAttached)
    (*cachedJVM)->DetachCurrentThread(cachedJVM);
}
