//
//  GetBookData.swift
//  GoodideasStudio Tenlong Bookshelf
//
//  Created by 柏呈 on 2019/6/10.
//  Copyright © 2019 Jerry. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension bookViewController {
    
    @objc func getBooksData(){
        guard let url = URL(string: bookDataUrl) else { return }
        LoadingAnimation.startLoading(message: "載入書籍資料")
        AF.request(url).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let list = json["list"].arrayValue
                var books = [BookShelf]()
                for bookOfJson in list {
                    let book = BookShelf(json: bookOfJson)
                    books.append(book)
                }
                let deduplicationBooks = Array(Set(books))
                self.books = deduplicationBooks
                let updateTime = json["updatedAt"].doubleValue as TimeInterval
                let dateString = self.getUpdateTime(timeinterval: updateTime)
                print("更新時間：\(dateString)")
                LoadingAnimation.endLoading(message: "更新時間：\(dateString)")
                self.refreshControl.endRefreshing()
            case .failure(let error):
                LoadingAnimation.endLoading(message: "更新失敗")
                print("錯誤訊息：\(error.localizedDescription)")
                self.refreshControl.endRefreshing()
            }
        }
        
    }
}
