//
//  bookView.swift
//  GoodideasStudio Tenlong Bookshelf
//
//  Created by 柏呈 on 2019/6/10.
//  Copyright © 2019 Jerry. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Collection view datasource and delegate
extension bookViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchBooks.count
        } else {
            return books.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        var book: BookShelf!
        
        if searchController.isActive {
            book = searchBooks[indexPath.row]
        } else {
            book = books[indexPath.row]
        }
        guard let bookCell = cell as? BookShelfCollectionViewCell else {return UICollectionViewCell()}
        bookCell.bookUpade(bookUpdate: book)
        
        return bookCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if searchController.isActive {
            selectedBook = searchBooks[indexPath.row]
        } else {
            selectedBook = books[indexPath.row]
        }
        performSegue(withIdentifier: BookshelfSeugeIdenifier.linkToWebView, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !searchController.isActive {
            cell.alpha = 0.5
            cell.transform = CGAffineTransform(translationX: cell.bounds.width, y: cell.bounds.height / 3).concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
            UIView.animate(withDuration: 0.4) {
                cell.alpha = 1
                cell.transform = CGAffineTransform.identity
            }
        }
    }
    
}

// MARK: Collection view delegate flow layout
extension bookViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.bounds.width - 30) / 2
        let height = width / 2 * 3
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

// MARK: - UIScrollViewDelegate
extension bookViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= scrollView.bounds.height {
            showFloatingButton()
        } else {
            hideFloatingButton()
        }
    }
}

// MARK: - UISearchResultsUpdating
extension bookViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            searchBooks = books.filter({ (book) -> Bool in
                return book.name.lowercased().contains(text.lowercased())
            })
        }
    }
}
