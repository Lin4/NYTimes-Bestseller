//
//  BookVC.swift
//  NYTimes Bestseller
//
//  Created by Lingeswaran Kandasamy on 1/5/18.
//  Copyright © 2018 Lingeswaran Kandasamy. All rights reserved.
//

import UIKit

class BookVC: UIViewController {
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitleLbl: UILabel!
    @IBOutlet weak var authorNameLbl: UILabel!
    @IBOutlet weak var bookDetailDesc: UILabel!

    
 
    var selectedBooks: books!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = selectedBooks.bookName
        print("hello my headache", BestSellerListName.instance.bestSellerListName)
        bookImage.downloadedFrom(link: selectedBooks.bookImageURL)
        bookTitleLbl.text = selectedBooks.bookName
        authorNameLbl.text = selectedBooks.authorName
        bookDetailDesc.text = selectedBooks.description
        
        }
    @IBAction func amazonBtnPressed(_ sender: Any) {
        open(scheme: selectedBooks.amazonURL)
    }

    @IBAction func nYTReviewBtnPressed(_ sender: Any) {
        open(scheme: selectedBooks.reviewURL)
    }
    
    func open(scheme: String) {
        if let url = URL(string: scheme) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:],
                                          completionHandler: {
                                            (success) in
                                            print("Open \(scheme): \(success)")
                })
            } else {
                let success = UIApplication.shared.openURL(url)
                print("Open \(scheme): \(success)")
            }
        }
    }
}
