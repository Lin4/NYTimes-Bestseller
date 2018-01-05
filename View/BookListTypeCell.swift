//
//  BookListTypeCell.swift
//  NYTimes Bestseller
//
//  Created by Lingeswaran Kandasamy on 1/4/18.
//  Copyright © 2018 Lingeswaran Kandasamy. All rights reserved.
//

import UIKit

class BookListTypeCell: UITableViewCell {

    @IBOutlet weak var bestSellerListImg: UIImageView!
    @IBOutlet weak var bestSellerListLbl: UILabel!
    
    
    func configureCell(bookList: bookLists) {
        
        bestSellerListImg.image = UIImage(named: bookList.displayListName.removingWhitespaces())
        bestSellerListLbl.text = bookList.displayListName
    }
}
extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}


