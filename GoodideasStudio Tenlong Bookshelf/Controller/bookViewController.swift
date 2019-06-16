//
//  bookViewController.swift
//  GoodideasStudio Tenlong Bookshelf
//
//  Created by 柏呈 on 2019/6/7.
//  Copyright © 2019 Jerry. All rights reserved.
//

import UIKit



class bookViewController: UIViewController {
    
    
    @IBOutlet weak var bookCollectionView: UICollectionView!
    @IBOutlet weak var backToTopButton: UIButton!
    
    let bookDataUrl = "https://bookshelf.goodideas-studio.com/api"
    var selectedBook: BookShelf?
    var refreshControl: UIRefreshControl!
    var searchController: UISearchController!
    var searchBooks = [BookShelf]() {
        didSet {
            bookCollectionView.reloadData()
        }
    }
    var books = [BookShelf]() {
        didSet {
            bookCollectionView.reloadData()
        }
    }
    
    @IBAction func scrollToTop(_ sender: UIButton) {
        bookCollectionView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.view.backgroundColor = .white
        bookCollectionView.dataSource = self
        bookCollectionView.delegate = self
        configureSearchController()
        configureRefreshControl()
        floatingButtonShadow(backToTopButton)
        getBooksData()
        hideFloatingButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LoadingAnimation.remove()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case BookshelfSeugeIdenifier.linkToWebView:
            if let bookWebVC = segue.destination as? BookTelongWebViewController {
                bookWebVC.urlString = selectedBook?.link
            }
        default:
            break
        }
    }
    
 
    
    
    func getUpdateTime(timeinterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeinterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY.MM.dd"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "搜尋書名"
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barTintColor = .white
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.returnKeyType = .done
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.white
                backgroundview.layer.cornerRadius = 10
                backgroundview.clipsToBounds = true
            }
        }
    }
    
    func configureRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.alpha = 0
        refreshControl.addTarget(self, action: #selector(getBooksData), for: .valueChanged)
        bookCollectionView.addSubview(refreshControl)
    }
    
    func floatingButtonShadow(_ button: UIButton) {
        button.layer.shadowOffset = CGSize(width: button.bounds.width / 10, height: button.bounds.width / 10)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
    }
    
    func showFloatingButton() {
        UIView.animate(withDuration: 0.4) {
            self.backToTopButton.transform = .identity
            self.backToTopButton.alpha = 1
        }
    }
    
    func hideFloatingButton() {
        UIView.animate(withDuration: 0.4) {
            self.backToTopButton.transform = CGAffineTransform(translationX: 0 , y: 50)
            self.backToTopButton.alpha = 0
        }
    }
    
}

struct BookshelfSeugeIdenifier {
    static let linkToWebView = "linkToWebView"
}
