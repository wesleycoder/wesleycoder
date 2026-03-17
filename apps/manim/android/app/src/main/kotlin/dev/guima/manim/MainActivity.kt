package dev.guima.manim

import android.annotation.SuppressLint
import android.app.Activity
import android.content.pm.ApplicationInfo
import android.os.Bundle
import android.util.Log
import android.webkit.JavascriptInterface
import android.webkit.WebChromeClient
import android.webkit.WebView
import android.webkit.WebViewClient
import java.util.concurrent.CountDownLatch
import android.os.Looper

class NimoyNativeBridge(private val activity: MainActivity) {
  @JavascriptInterface
  fun postMessage(jsonPayload: String): String {
    if (Looper.myLooper() == Looper.getMainLooper()) {
      return activity.sendNimMessage(jsonPayload)
    }

    var result = ""
    val latch = CountDownLatch(1)

    activity.runOnUiThread {
      result = activity.sendNimMessage(jsonPayload)
      latch.countDown()
    }

    latch.await()
    return result
  }
}

class MainActivity : Activity() {

  private lateinit var webView: WebView
  private external fun startNimBackend()
  external fun sendNimMessage(jsonPayload: String): String

  companion object {
    init {
      try {
        System.loadLibrary("nimoy")
      } catch (e: UnsatisfiedLinkError) {
        Log.e("nimoy", "Failed to load libnimoy.so", e)
      }
    }
  }

  @SuppressLint("SetJavaScriptEnabled")
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    webView = WebView(this).apply {
      settings.javaScriptEnabled = true
      settings.domStorageEnabled = true
      webViewClient = WebViewClient()
      webChromeClient = WebChromeClient()
      addJavascriptInterface(NimoyNativeBridge(this@MainActivity), "__ManimNative")
    }

    setContentView(webView)

    val isDebug = (applicationInfo.flags and ApplicationInfo.FLAG_DEBUGGABLE) != 0

    val url = if (isDebug) "http://10.0.2.2:4321/" else "file:///android_asset/index.html"
    if (isDebug) WebView.setWebContentsDebuggingEnabled(true)

    webView.loadUrl(url)

    startNimBackend()
  }

  fun evaluateJavascript(script: String) {
    runOnUiThread {
      webView.evaluateJavascript(script, null)
    }
  }
}
