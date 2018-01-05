//
//  BookListService.swift
//  NYTimes Bestseller
//
//  Created by Lingeswaran Kandasamy on 1/4/18.
//  Copyright © 2018 Lingeswaran Kandasamy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BookListService {
    
    static let instance = BookListService()
    
     var bestSellerLists = [bookLists]()
    
    func downloadBestSellerBookList(completed: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_BEST_SELLERS_LIST).responseJSON { (response) in
            if ((response.result.value) != nil) {
                let data = JSON(response.result.value!)
                if let listArray = data["results"].array{
                    for bestSellerList in listArray {
                        let name = bestSellerList["list_name"].string
                        let displayName = bestSellerList["display_name"].string
                        let sellerLists = bookLists(bookListName: name!, displayListName: displayName!)
                        self.bestSellerLists.append(sellerLists)
                    }
                    completed(true)
                }
                
            }
            
        }
    }
}


