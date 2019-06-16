//
//  LoadingAnimation.swift
//  GoodideasStudio Tenlong Bookshelf
//
//  Created by 柏呈 on 2019/6/7.
//  Copyright © 2019 Jerry. All rights reserved.
//

import Foundation
import UIKit

 class LoadingAnimation {
    
    private static var loadingView: UIView?
    private static var LoadingSpinner: UIActivityIndicatorView?
    private static var ShowMessageLabel: UILabel?
    
    public static func startLoading(message: String?) {
        
        if loadingView == nil, let window = UIApplication.shared.keyWindow {
            loadingView = UIView()
            loadingView?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            loadingView?.center = window.center
            loadingView?.backgroundColor = .darkGray
            loadingView?.alpha = 0.9
            loadingView?.layer.cornerRadius = 10
            loadingView?.clipsToBounds = true
            LoadingSpinner = UIActivityIndicatorView()
            LoadingSpinner?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            LoadingSpinner?.center = CGPoint(x: loadingView!.bounds.midX, y: loadingView!.bounds.midY - 15)
            LoadingSpinner?.style = .whiteLarge
            LoadingSpinner?.startAnimating()
            ShowMessageLabel = UILabel()
            ShowMessageLabel?.frame = CGRect(x: 0, y: loadingView!.bounds.midY + 20, width: 200, height: 20)
            ShowMessageLabel?.center = CGPoint(x: window.center.x, y: window.center.y + 20)
            ShowMessageLabel?.textColor = .white
            ShowMessageLabel?.font = UIFont(name: "PingFangTC-Medium", size: 13)
            ShowMessageLabel?.textAlignment = .center
            ShowMessageLabel?.text = message
            loadingView?.addSubview(LoadingSpinner!)
            window.addSubview(loadingView!)
            window.addSubview(ShowMessageLabel!)
        }
    }
    
    public static func endLoading(message: String?) {
        if let loadingView = loadingView, let window = UIApplication.shared.keyWindow {
            UIView.animate(withDuration: 0.4, animations: {
                loadingView.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
                loadingView.center = window.center
                LoadingSpinner?.center = CGPoint(x: loadingView.bounds.midX, y: loadingView.bounds.midY)
                ShowMessageLabel?.center = window.center
                ShowMessageLabel?.text = message
                LoadingSpinner?.alpha = 0
            }) { _ in
                UIView.animate(withDuration: 1.2, animations: {
                    ShowMessageLabel?.center.y -= 50
                    ShowMessageLabel?.alpha = 0
                    loadingView.center.y -= 50
                    loadingView.alpha = 0
                }, completion: { _ in
                    remove()
                })
            }
        }
    }
    
    public static func remove() {
        self.loadingView?.removeFromSuperview()
        self.ShowMessageLabel?.removeFromSuperview()
        self.LoadingSpinner?.removeFromSuperview()
        self.loadingView = nil
        self.ShowMessageLabel = nil
        self.LoadingSpinner = nil
    }
}

