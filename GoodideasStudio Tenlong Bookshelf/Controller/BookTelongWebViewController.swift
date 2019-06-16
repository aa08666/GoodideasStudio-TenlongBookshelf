//
//  TenlongWeb.swift
//  GoodideasStudio Tenlong Bookshelf
//
//  Created by 柏呈 on 2019/6/7.
//  Copyright © 2019 Jerry. All rights reserved.
//

import UIKit
import WebKit

class BookTelongWebViewController: UIViewController, WKUIDelegate {
    
    var urlString: String?
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        webView.navigationDelegate = self
        if let string = urlString, let url = URL(string: string) {
            let myRequest = URLRequest(url: url)
            webView.load(myRequest)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LoadingAnimation.remove()
    }
    
}

extension BookTelongWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        LoadingAnimation.startLoading(message: "Loading")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        LoadingAnimation.endLoading(message: "Compelete")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        LoadingAnimation.endLoading(message: "loading failed")
    }
}
