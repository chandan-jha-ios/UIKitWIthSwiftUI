//
//  WebViewCoordinator.swift
//  UIKitWithSwiftUI
//
//  Created by Chandan Jha on 08/09/22.
//

import UIKit
import WebKit
import SwiftUI

final class WebData: ObservableObject {
  @Published var loading: Bool = false
  @Published var url: URL?;

  init (url: URL) {
    self.url = url
  }
}

final class WebViewCoordinator: NSObject, WKNavigationDelegate {
  @ObservedObject var data: WebData
  var webView: WKWebView = WKWebView()
  var loadedUrl: URL? = nil

  init(data: WebData) {
    self.data = data
    super.init()
    webView.navigationDelegate = self
  }

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    DispatchQueue.main.async {
      self.data.loading = false
    }
  }

  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    DispatchQueue.main.async { self.data.loading = true }
  }

  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
      print(error)
    DispatchQueue.main.async { self.data.loading = false }
  }

  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    DispatchQueue.main.async { self.data.loading = false }
  }
}
