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
    var bookList = [BookList]()
    func findAllBookListTypes(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_BEST_SELLERS_LIST).responseJSON { (response) in
            if ((response.result.value) != nil) {
                let data = JSON(response.result.value!)
                if let list = data["results"].array{
                    for bookLists in list {
                        let name = bookLists["list_name"].stringValue
                        let displayName = bookLists["display_name"].stringValue
                        let list = BookList(bookListName: name, displayListName: displayName)
                        self.bookList.append(list)
                    }
                    print(self.bookList)
                    completion(true)
                }
               
            } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
            }
        }
    }
    
}

