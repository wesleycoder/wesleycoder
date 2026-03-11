import Foundation
import UIKit
import WebKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    NSLog("[ManimApp] 1. Building UI Window")
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()

    NSLog("[ManimApp] 2. Waking up Nim")
    NimMain()

    NSLog("[ManimApp] 3. Setting up Nim callback")
    initManimIos { script in
      NSLog("[ManimApp] 3.1. AppDelegate: Nim callback triggered")
      guard let script = script else { return }
      let jsString = String(cString: script)

      DispatchQueue.main.async {
        NSLog("[ManimApp] 4. Callback fired! Sending JS to WebView")
        if let delegate = UIApplication.shared.delegate as? AppDelegate,
          let vc = delegate.window?.rootViewController as? ViewController
        {
          vc.webView?.evaluateJavaScript(jsString, completionHandler: nil)
        }
      }
    }

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()
    return true
  }
}

class ViewController: UIViewController, WKScriptMessageHandlerWithReply {
  var webView: WKWebView!

  override func loadView() {
    let config = WKWebViewConfiguration()
    let contentController = WKUserContentController()

    config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
    config.setValue(true, forKey: "allowUniversalAccessFromFileURLs")

    contentController.addScriptMessageHandler(self, contentWorld: .page, name: "manim")
    config.userContentController = contentController

    webView = WKWebView(frame: .zero, configuration: config)

    if #available(iOS 16.4, *) { webView.isInspectable = true }
    self.view = webView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    NSLog("[ManimApp] View: viewDidLoad started")

    if let indexURL = Bundle.main.url(forResource: "index", withExtension: "html") {
      NSLog("[ManimApp] Loading HTML from: \(indexURL.path)")
      webView.loadFileURL(indexURL, allowingReadAccessTo: Bundle.main.bundleURL)
    } else {
      NSLog("[ManimApp] ❌ FATAL ERROR: Could not find index.html in bundle")
    }
  }

  func userContentController(
    _ userContentController: WKUserContentController,
    didReceive message: WKScriptMessage,
    replyHandler: @escaping (Any?, String?) -> Void
  ) {
    if message.name == "manim", let body = message.body as? String {
      body.withCString { cStr in
        let resultPtr = handleNativeMessage(UnsafeMutablePointer(mutating: cStr))

        if let resultPtr = resultPtr {
          let resultString = String(cString: resultPtr)
          replyHandler(resultString, nil)
        } else {
          replyHandler(nil, nil)
        }
      }
    } else {
      replyHandler(nil, "Unknown message")
    }
  }
}
