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
    let mainVC = ViewController()

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = mainVC
    window?.makeKeyAndVisible()

    NimMain()

    initIos { script in
      guard let script else { return }
      let jsString = String(cString: script)

      DispatchQueue.main.async {
        mainVC.webView?.evaluateJavaScript(jsString, completionHandler: nil)
      }
    }

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

    contentController.addScriptMessageHandler(self, contentWorld: .page, name: "nimoy")
    config.userContentController = contentController

    webView = WKWebView(frame: .zero, configuration: config)

    if #available(iOS 16.4, *) { webView.isInspectable = true }
    self.view = webView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    if let indexURL = Bundle.main.url(forResource: "index", withExtension: "html") {
      webView.loadFileURL(indexURL, allowingReadAccessTo: Bundle.main.bundleURL)
    } else {
      NSLog("ERROR: Could not find index.html in bundle")
    }
  }

  func userContentController(
    _ userContentController: WKUserContentController,
    didReceive message: WKScriptMessage,
    replyHandler: @escaping (Any?, String?) -> Void
  ) {
    guard message.name == "nimoy", let body = message.body as? String else {
      replyHandler(nil, "Unknown message")
      return
    }
    body.withCString { cStr in
      let resultPtr = handleNativeMessage(UnsafeMutablePointer(mutating: cStr))

      if let resultPtr {
        let resultString = String(cString: resultPtr)
        replyHandler(resultString, nil)
      } else {
        replyHandler(nil, nil)
      }
    }
  }
}
