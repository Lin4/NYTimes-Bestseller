//
//  ViewController.swift
//  NYTimes Bestseller
//
//  Created by Lingeswaran Kandasamy on 1/3/18.
//  Copyright © 2018 Lingeswaran Kandasamy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        initBooks()
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    func initBooks() {
        DispatchQueue.main.async {
            BookListService.instance.downloadBestSellerBookList{ (success) in
                self.tableView.reloadData()
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookListService.instance.bestSellerLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BestSellerList", for: indexPath) as? BookListTypeCell {
            let bestSellerList = BookListService.instance.bestSellerLists[indexPath.row]
            cell.configureCell(bookList: bestSellerList)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let category = BookListService.instance.bestSellerLists[indexPath.row]
            BestSellerListName.instance.bestSellerListName = category.bookListName
            performSegue(withIdentifier: "BookDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BookDetailsVC" {
             let destination = segue.destination as? BookDetailVC
            destination?.bestSellerList = BestSellerListName.instance.bestSellerListName
        }
    }
}

