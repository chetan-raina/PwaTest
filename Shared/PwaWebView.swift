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
        
        // receive message from wkwebview
        func userContentController(
            _ userContentController: WKUserContentController,
            didReceive message: WKScriptMessage
        ) {
            
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> some UIView {
//        let webView = WKWebView()
//
//        let request = URLRequest(url: url)
//        webView.load(request)
//        return webView
        
        let coordinator = makeCoordinator()
        let userContentController = WKUserContentController()
        userContentController.add(coordinator, name: "bridge")
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        let url = URL(string: "http://localhost:3000/?sessionToken=6Jv9UhDufGfAjjgSUsz6Wr6UIVqB2bV0")!
        
//        let url = (Bundle.main.url(forResource: "index", withExtension: "html"))!
        
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
//    var body: some View {
//        NavigationView {
//            Text("Welcome to the shop")
//        }
//    }
}
