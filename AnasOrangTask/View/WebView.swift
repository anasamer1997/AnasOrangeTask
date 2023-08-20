//
//  WebView.swift
//  AnasNewsTask
//
//  Created by mac on 15/08/2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url:URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
         uiView.load(request)
        
    }
    
    
}

