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
        BookListService.instance.downloadBestSellerBookList{_ in
            self.tableView.reloadData()
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
        
            performSegue(withIdentifier: "BookDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BookDetailsVC" {
            if let destination = segue.destination as? BookDetailVC {
                if let book = sender as? Books {
                    destination.bookToEdit = book
                }
            }
        }
        
    }
}

