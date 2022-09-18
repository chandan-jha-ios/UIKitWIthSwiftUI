//
//  WebViewWrapper.swift
//  UIKitWithSwiftUI
//
//  Created by Chandan Jha on 08/09/22.
//

import SwiftUI
import WebKit
import Combine

struct WebViewWrapper: UIViewRepresentable {
    
    @Binding var data: WebData
    
    func makeUIView(context: Context) -> WKWebView {
        context.coordinator.webView
    }
    
    func updateUIView(_ view: WKWebView, context: Context) {
        guard context.coordinator.loadedUrl != data.url else { return }
        context.coordinator.loadedUrl = data.url
        
        if let url = data.url {
            DispatchQueue.main.async {
                let request = URLRequest(url: url)
                view.load(request)
            }
        }
        
        context.coordinator.data.url = data.url
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(data: data)
    }
}
