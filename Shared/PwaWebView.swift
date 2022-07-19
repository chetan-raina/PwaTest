//
//  WebView.swift
//  PwaTest
//
//  Created by Chetan Raina on 23/06/22.
//

import Foundation
import SwiftUI
import WebKit

struct PwaWebView: UIViewRepresentable {
    
    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        var webView: WKWebView?
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.webView = webView
        }
        
        // receive message from wkwebview
        func userContentController(
            _ userContentController: WKUserContentController,
            didReceive message: WKScriptMessage
        ) {
            print(message.body)
            let date = Date()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.messageToWebview(msg: "hello, I got your messsage: \(message.body) at \(date)")
            }
        }
        
        func messageToWebview(msg: String) {
            self.webView?.evaluateJavaScript("webkit.messageHandlers.bridge.onMessage('\(msg)')")
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let coordinator = makeCoordinator()
        let userContentController = WKUserContentController()
        userContentController.add(coordinator, name: "bridge")
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = coordinator
        
//        this works
        let url = (Bundle.main.url(forResource: "index", withExtension: "html"))!
        
//        this doesn't
//         let url = URL(string: "http://localhost:3000/?sessionToken=5yq98jHJNp2V3XvTmg2xJUVWRf2WftNC")!
        
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
