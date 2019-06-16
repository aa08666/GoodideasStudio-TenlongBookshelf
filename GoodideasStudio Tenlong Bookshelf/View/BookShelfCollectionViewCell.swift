//
//  BookShelfCollectionViewCell.swift
//  GoodideasStudio Tenlong Bookshelf
//
//  Created by 柏呈 on 2019/6/6.
//  Copyright © 2019 Jerry. All rights reserved.
//

import UIKit
import Kingfisher

class BookShelfCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookOriginPriceLabel: UILabel!
    @IBOutlet weak var bookDiscountPriceLabel: UILabel!
    @IBOutlet weak var bookSellPriceLabel: UILabel!
    @IBOutlet weak var bookMoreDetailLabel: UILabel!
    
    func bookUpade(bookUpdate: BookShelf) {
       
        if let bookDiscount = bookUpdate.discount {
            bookOriginPriceLabel.text = "原價： $\(bookUpdate.originPrice)"
            bookDiscountPriceLabel.text = "(\(bookDiscount))"
            bookDiscountPriceLabel.isHidden = false
            bookOriginPriceLabel.isHidden = false
            
            
        }else{
            bookDiscountPriceLabel.isHidden = true
            bookOriginPriceLabel.isHidden = true
        }
        if let imageUrl = URL(string: bookUpdate.image) {
            bookImage.kf.setImage(with: imageUrl)
        }
        bookSellPriceLabel.text = "特價：＄\(bookUpdate.sellPrice)"
    
    }
    
    
    
}
