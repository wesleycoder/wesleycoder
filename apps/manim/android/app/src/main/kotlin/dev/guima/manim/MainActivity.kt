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

class ManimNativeBridge(private val activity: MainActivity) {
  @JavascriptInterface
  fun postMessage(jsonPayload: String): String {
    return activity.sendNimMessage(jsonPayload)
  }
}

class MainActivity : Activity() {

  private lateinit var webView: WebView
  private external fun startNimBackend()
  external fun sendNimMessage(jsonPayload: String): String

  companion object {
    init {
      try {
        System.loadLibrary("manim")
      } catch (e: UnsatisfiedLinkError) {
        Log.e("ManimApp", "Failed to load libmanim.so", e)
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
      addJavascriptInterface(ManimNativeBridge(this@MainActivity), "__ManimNative")
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
