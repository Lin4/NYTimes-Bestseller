//
//  BookList.swift
//  NYTimes Bestseller
//
//  Created by Lingeswaran Kandasamy on 1/4/18.
//  Copyright © 2018 Lingeswaran Kandasamy. All rights reserved.
//

import Foundation
struct bookLists: Decodable {
    private(set) public var bookListName: String!
    private(set) public var displayListName: String!
   
    init(bookListName: String, displayListName: String) {
        self.bookListName = bookListName
        self.displayListName = displayListName
    }
}
