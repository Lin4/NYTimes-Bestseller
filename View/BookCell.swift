
//
//  CollectionViewCell.swift
//  NYTimes Bestseller
//
//  Created by Lingeswaran Kandasamy on 1/5/18.
//  Copyright © 2018 Lingeswaran Kandasamy. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookRankLbl: UILabel!
    @IBOutlet weak var bookWeekOnListLbl: UILabel!
    
    func updateViews(book: books) {
        bookRankLbl.text = String(book.rank)
        bookWeekOnListLbl.text = String(book.weeksOnList)
        if let url = book.bookImageURL {
            self.bookImageView.loadImageUsingCacheWithURLString(url, placeHolder: UIImage(named: "placeholder"))
        }
    }
}

