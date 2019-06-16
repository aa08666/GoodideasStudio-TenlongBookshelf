//
//  WishWebViewController.swift
//  GoodideasStudio Tenlong Bookshelf
//
//  Created by 柏呈 on 2019/6/12.
//  Copyright © 2019 Jerry. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://docs.google.com/forms/d/e/1FAIpQLSdbpAoBWVEy0RcRi_tk3gzeUbTpa2jjbc8PfcwP7-aBfmz3zA/viewform"
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
    }
    
}
