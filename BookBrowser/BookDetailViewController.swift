//
//  BookDetailViewController.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/12.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{


    @IBOutlet weak var tableView: UITableView!
    var button: UIButton?
    
    //MARK: - Property -
    var book: Book!
    var page = 0
    var reviews = [Review]()
    
    //MARK: - View Life Circle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if book != nil {
            DetailBookHeaderView.showInTableView(tableView, book: book)
            //labelTitle.text = book.title
        } else {
            tableView.footerEndRefreshNoMoreData()
        }
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()

        loadComment()
        
        
//        button = UIButton()
//        button!.backgroundColor = UIColor.blueColor()
//        self.view.addSubview(button!)
        
        
//        let centerConstraint = NSLayoutConstraint(item: button!, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
//        self.view.addConstraint(centerConstraint)
//        
//        let widthConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[button[width]]", options: NSLayoutFormatOptions.rawValue, metrics: ["width": 100], views: ["button": button!])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
//        tableView.footerAddMJRefresh { () -> Void in
//            NetManager.getReviewsWithBookId(self.book.id, page: self.page, resultClosure: { (result, reviews) -> Void in
//                if result {
//                    let count = self.reviews.count
//                    var indexPaths = [NSIndexPath]()
//                    for (i,review) in reviews.enumerate() {
//                        self.reviews.append(review)
//                        indexPaths.append(NSIndexPath(forRow: count+i, inSection: 0))
//                    }
//                    if indexPaths.isEmpty {
//                        self.tableView.footerEndRefreshNoMoreData()
//                    } else {
//                        self.page += 1
//                        self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
//                        self.tableView.footerEndRefresh()
//                    }
//                } else {
//                    self.view.makeToast("网络异常，请上拉重试")
//                    self.tableView.footerEndRefresh()
//                }
//            })
//        }
//        
//        tableView.footerBeginRefresh()
    }

    
    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReviewCell") as! ReviewTableViewCell
        cell.configureWithReview(reviews[indexPath.row])
        
        return cell
    }
    
    // MARK: - Navigation 页面跳转 -
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "showCommentWebViewSegue"){
            
            let commentWebViewController = segue.destinationViewController as! CommentWebViewController
            
            if let indexPath = tableView.indexPathForCell(sender as! ReviewTableViewCell)
            {
                let review = reviews[indexPath.row]
                commentWebViewController.url = NSURL(string: review.alt)
                
            } else if let url = sender as? NSURL {
                commentWebViewController.url = url
            }

        }
        
    }
    
    //MARK: - Load comment -
    func loadComment(){
        tableView.footerAddMJRefresh { () -> Void in
            NetManager.getReviewsWithBookId(self.book.id, page: self.page, resultClosure: { (result, reviews) -> Void in
                if result {
                    let count = self.reviews.count
                    var indexPaths = [NSIndexPath]()
                    for (i,review) in reviews.enumerate() {
                        self.reviews.append(review)
                        indexPaths.append(NSIndexPath(forRow: count+i, inSection: 0))
                    }
                    if indexPaths.isEmpty {
                        self.tableView.footerEndRefreshNoMoreData()
                    } else {
                        self.page += 1
                        self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
                        self.tableView.footerEndRefresh()
                    }
                } else {
                    self.view.makeToast("网络异常，请上拉重试")
                    self.tableView.footerEndRefresh()
                }
            })
        }
        
        tableView.footerBeginRefresh()
    }


}
