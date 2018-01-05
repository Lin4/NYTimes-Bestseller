//
//  BookDetailVC.swift
//  NYTimes Bestseller
//
//  Created by Lingeswaran Kandasamy on 1/4/18.
//  Copyright © 2018 Lingeswaran Kandasamy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BookDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{

    
    @IBOutlet weak var bookCollection: UICollectionView!
    var bestSellerList: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        bookCollection.dataSource = self
        bookCollection.delegate = self
        self.initBooks()
    }
    
    func initBooks() {
        DispatchQueue.main.async {
            BookDetailService.instance.downloadBestSellerBooks{_ in
            }
        }
        navigationItem.title = bestSellerList
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return BookDetailService.instance.book.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCell {
            let books = BookDetailService.instance.book[indexPath.row]
            cell.updateViews(book: books)
            return cell
        }
        return BookCell()
    }
    
}
