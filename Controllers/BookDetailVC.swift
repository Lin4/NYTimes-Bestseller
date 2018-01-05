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
     @IBOutlet weak var segment: UISegmentedControl!
    
    var bestSellerList: String!
    var dataSort: String! = "by_week"
    var sortedBookArray: [books]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookCollection.dataSource = self
        bookCollection.delegate = self
        self.initBooks()
    }
    
    func initBooks() {
        DispatchQueue.main.async {
            BookDetailService.instance.downloadBestSellerBooks{_ in
                self.bookCollection.reloadData()
            }
        }
        navigationItem.title = bestSellerList
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return BookDetailService.instance.book.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCell {
                sortBookArray(dataSort: dataSort)
                let books = sortedBookArray[indexPath.row]
                cell.updateViews(book: books)
                return cell
            }
        return BookCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let book = BookDetailService.instance.book[indexPath.row]
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let bookVC = mainStoryboard.instantiateViewController(withIdentifier: "bookVC") as! BookVC
        self.navigationController?.pushViewController(bookVC, animated: true)
        bookVC.selectedBooks = book
    }
    
    func attemptFetch() {
      if segment.selectedSegmentIndex == 0 {
            dataSort = "by_week"
        } else if segment.selectedSegmentIndex == 1 {
        
            dataSort = "rank"
        }
    }
    
    func sortBookArray(dataSort: String) {
        if dataSort == "by_week"{
         let arraySory = BookDetailService.instance.book
            sortedBookArray = arraySory.sorted {
            $0.weeksOnList > $1.weeksOnList
            }
        }else if dataSort == "rank"{
            let arraySory = BookDetailService.instance.book
            sortedBookArray = arraySory.sorted {
                $0.rank < $1.rank
            }
    }
}
    @IBAction func segmentChange(_ sender: AnyObject) {
        attemptFetch()
        print("LIN", dataSort)
        sortBookArray(dataSort: dataSort)
        bookCollection.reloadData()
        
    }
    
}
