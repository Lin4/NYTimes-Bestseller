//
//  BookDetailService.swift
//  NYTimes Bestseller
//
//  Created by Lingeswaran Kandasamy on 1/4/18.
//  Copyright © 2018 Lingeswaran Kandasamy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BookDetailService {
    static let instance = BookDetailService()
    var book = [books]()
    
    func downloadBestSellerBooks(completed: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_BEST_SELLERS_LIST_DETAILS).responseJSON { (response) in
            if ((response.result.value) != nil) {
                let data = JSON(response.result.value!)
                if let bookArray = data["books"].array{
                    for bestSellerBooks in bookArray {
                        let title = bestSellerBooks["title"].string
                        let authorName = bestSellerBooks["author"].string
                        let rank = bestSellerBooks["rank"].int
                        let weeksOnList = bestSellerBooks["weeks_on_list"].int
                        let description = bestSellerBooks["description"].string
                        let amazonURL = bestSellerBooks["amazon_product_url"].string
                        let reviewURL = bestSellerBooks["book_review_link"].string
                        let boolImageURL = bestSellerBooks["book_image"].string
                        let sellerLists = books(bookName: title!, authorName: authorName!, rank: rank!, weeksOnList: weeksOnList!, description: description!, amazonURL: amazonURL!, reviewURL: reviewURL!, bookImageURL: boolImageURL!)
                        self.book.append(sellerLists)
                    }
                    completed(true)
                }
                
            }
            
        }
    }
}
