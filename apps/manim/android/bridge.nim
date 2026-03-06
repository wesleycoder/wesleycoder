{.used.}
{.
  emit: """
    #include <jni.h>
    #include <android/log.h>

    #define LOGI(...) __android_log_print(ANDROID_LOG_INFO, "ManimNim", __VA_ARGS__)

    JNIEXPORT void JNICALL Java_dev_guima_manim_MainActivity_startNimBackend(JNIEnv *env, jobject obj) {
        LOGI("Hello from Nim! The backend has successfully started!");
    }
  """
.}
