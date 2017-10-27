//
//  DetailBookHeaderView.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/14.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class DetailBookHeaderView: UIView {

//    @IBOutlet weak var headViewContainView: UIView!
//    @IBOutlet weak var bookImageView: UIImageView!
//    @IBOutlet weak var bookName: UILabel!
//    @IBOutlet weak var rateView: UIView!
//    @IBOutlet weak var ratePeopleNumberLabel: UILabel!
//    @IBOutlet weak var bookPublisherDetialLabel: UILabel!
//    @IBOutlet weak var bookSummaryLabel: UILabel!
//    
//    var tableView: UITableView!
//    var book: Book!
//    
//    static func showInTableView(tableView: UITableView,book:Book) -> DetailBookHeaderView {
//        let headView = NSBundle.mainBundle().loadNibNamed("DetailBookHeaderView", owner: nil, options: nil)[0] as! DetailBookHeaderView
//        headView.configureWith(tableView, book: book)
//        return headView
//    }
//    
//    
//    // MARK: - LifeCycle
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        frame.size.height = headViewContainView.frame.size.height
//        tableView.tableHeaderView = self
//    }
//    
//    
//    // MARK: -
//    
//    func configureWith(tableView: UITableView,book: Book) {
//        self.tableView = tableView
//        self.book = book
//        bookImageView.sd_setImageWithURL(NSURL(string: book.images["large"] ?? ""))
//        bookName.text = book.title
//        if let rating = book.rating {
//            RatingView.showInView(rateView, value: rating.average)
//            ratePeopleNumberLabel.text = "\(rating.numRaters)人评分"
//        } else {
//            RatingView.showNoRating(rateView)
//        }
//        
//        var desc = ""
//        for str in book.author {
//            desc += (str + "/")
//        }
//        
//        bookPublisherDetialLabel.text = desc + book.publisher + "/" + book.pubdate
//        bookSummaryLabel.text = book.summary
//        
//        self.tableView.tableHeaderView = self
//    }
    

}
