//
//  Constants.swift
//  NYTimes Bestseller
//
//  Created by Lingeswaran Kandasamy on 1/4/18.
//  Copyright © 2018 Lingeswaran Kandasamy. All rights reserved.
//

import Foundation
typealias CompletionHandler = (_ Success: Bool) -> ()

var PARAM = BestSellerListName.instance.bestSellerListName.replacingOccurrences(of: " ", with: "-")

// URL Constants
let BASE_URL = "https://api.nytimes.com/svc/books/v3/"

let URL_GET_BEST_SELLERS_LIST = "\(BASE_URL)lists/names.json?api-key=92c2940599c54dadb9bd2517a8d82226"

let BASE_URL_FOR_BOOK_DETAILS = "https://api.nytimes.com/svc/books/v3/lists/2016-12-11/"

let URL_ENDPOINT_BOOK_DETAILS = ".json?api-key=92c2940599c54dadb9bd2517a8d82226"
