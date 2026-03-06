package dev.guima.manim

import android.annotation.SuppressLint
import android.app.Activity
import android.content.pm.ApplicationInfo
import android.os.Bundle
import android.util.Log
import android.webkit.WebChromeClient
import android.webkit.WebView
import android.webkit.WebViewClient

class MainActivity : Activity() {

  companion object {
    init {
      try {
        System.loadLibrary("manim") // libmanim.so
      } catch (e: UnsatisfiedLinkError) {
        Log.e("Manim", "Failed to load libmanim.so (Nim backend not compiled yet)", e)
      }
    }
  }

  private external fun startNimBackend()

  @SuppressLint("SetJavaScriptEnabled")
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    val webView = WebView(this).apply {
      settings.javaScriptEnabled = true
      settings.domStorageEnabled = true
      webViewClient = WebViewClient()
      webChromeClient = WebChromeClient()
    }

    setContentView(webView)

    val isDebug = (applicationInfo.flags and ApplicationInfo.FLAG_DEBUGGABLE) != 0

    val url = if (isDebug) {
      "http://10.0.2.2:5173/"
    } else {
      "file:///android_asset/index.html"
    }

    webView.loadUrl(url)

    try {
      startNimBackend()
    } catch (e: UnsatisfiedLinkError) {
      Log.e("Manim", "startNimBackend() not found in JNI. Skipping...", e)
    }
  }
}
