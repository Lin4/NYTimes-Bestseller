
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
        bookImageView.downloadedFrom(link: book.bookImageURL)
        bookRankLbl.text = String(book.rank)
        bookWeekOnListLbl.text = String(book.weeksOnList)
    }
}
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
