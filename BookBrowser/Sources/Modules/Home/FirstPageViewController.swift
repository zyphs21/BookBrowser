//
//  FirstPageViewController.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/12.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {
// , MenuTransitionManagerDelegate, UITableViewDelegate, UITableViewDataSource
//    @IBOutlet weak var bookTableView: UITableView!
//    
//    
//    let menuTransitionManager = MenuTransitionManager()
//    let identifierBookCell = "BookCell"
//    var tag = "文学" //搜索关键字
//    var page = 0 //搜索页码
//    var pageSize = 10
//    var books = [Book]()
//    
//    
//    // MARK: - View life cricle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        //self.title = "文学作品"
//        self.navigationItem.title = "文学作品"
//        
//        bookTableView.delegate = self
//        bookTableView.dataSource = self
//        
//        addMJHeaderAndFooter()
//        bookTableView.headerBeginRefresh()
//        
//        // iOS 8 自动行高估算
//        bookTableView.estimatedRowHeight = 100
//        bookTableView.rowHeight = UITableViewAutomaticDimension
//        print("高度为" +  String(bookTableView.rowHeight))
//        
//        /*
//         **旧的在原页面嵌套 searchbar 的方法
//        let searchController = storyboard?.instantiateViewControllerWithIdentifier("BookSearchViewController") as! BookSearchViewController
//        searchController.firstPageViewController = self
//        searchView.addSubview(searchController.searchController.searchBar)
//        */
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    override func viewDidAppear(animated: Bool) {
////        self.tabBarController?.tabBar.hidden = false
//    }
//    
//    
//    // MARK: - tableView delegate
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return books.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let bookCell = tableView.dequeueReusableCellWithIdentifier(identifierBookCell, forIndexPath: indexPath) as! BookCell
//        bookCell.configureBookInfo(books[indexPath.row])
//        return bookCell
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        //self.performSegueWithIdentifier("toDetailPageView", sender: tableView.cellForRowAtIndexPath(indexPath))
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewControllerWithIdentifier("BookDetailViewController") as! BookDetailViewController
//        let book = books[indexPath.row]
//        viewController.book = book
//        navigationController?.pushViewController(viewController, animated: true)
//    }
//    
//    
//    // MARK: - MenuTransitionManagerDelegate 
//    
//    //下面的unwindToHome方法是点击了menu的cell，这里的dismiss是再次点击menu键触发
//    func dismiss() {
//        dismissViewControllerAnimated(true,completion: nil)
//    }
//
//    
//    // MARK: - Navigation 页面跳转
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if(segue.identifier == "showMenuSegue"){
//            
//            let menuTableViewController = segue.destinationViewController as! MenuTableViewController
////            menuTableViewController.currentItem = self.title!
//            menuTableViewController.currentItem = self.navigationItem.title!
//            menuTableViewController.transitioningDelegate = menuTransitionManager
//            menuTransitionManager.delegate = self
//        }
//        
//        if(segue.identifier == "toDetailPageView"){
//            
//            let bookDetailViewController = segue.destinationViewController as! BookDetailViewController
//            let indexPath = bookTableView.indexPathForCell(sender as! UITableViewCell)!
//            let book = books[indexPath.row]
//            bookDetailViewController.book = book
////            self.tabBarController?.tabBar.hidden = true
//            
//        }
//        
//    }
//    
//    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
//        
//        if(segue.identifier == "backToFirstViewSegue"){
//            let sourceController = segue.sourceViewController as! MenuTableViewController
//            self.navigationItem.title = sourceController.currentItem
////            self.title = sourceController.currentItem
//            
//            //根据选择的分类刷新首页书籍
//            let catalogTag=(sourceController.currentItem as NSString).substringToIndex(2)
//            print(catalogTag)
//            self.tag = catalogTag
//            bookTableView.headerBeginRefresh()
//        }
//        
//    }
//    
//    
//    //MARK: - MJRefresh 上下拉刷新
//    
//    private func addMJHeaderAndFooter() {
//        
//        bookTableView.headerAddMJRefresh { () -> Void in
//            self.bookTableView.footerResetNoMoreData()
//            
//            NetManager.getBookList(self.tag, page: 0, resultClosure: { (result, books) -> Void in
//                self.bookTableView.headerEndRefresh()
//                if result {
//                    self.page = 1
//                    self.books = books
//                    self.bookTableView.reloadData()
//                } else {
//                    self.view.makeToast("请求数据失败")
//                }
//            })
//        }
//        
//        bookTableView.footerAddMJRefresh { () -> Void in
//            
//            NetManager.getBookList(self.tag, page: self.page, resultClosure: { (result, books) -> Void in
//                
//                if result {
//                    var indexPaths = [NSIndexPath]()
//                    let count = self.books.count
//                    for (i,book) in books.enumerate() {
//                        self.books.append(book)
//                        indexPaths.append(NSIndexPath(forRow: count + i, inSection: 0))
//                    }
//                    
//                    if indexPaths.isEmpty {
//                        self.bookTableView.footerEndRefreshNoMoreData()
//                    } else {
//                        self.page += 1
//                        self.bookTableView.footerEndRefresh()
//                        self.bookTableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
//                    }
//                } else {
//                    self.bookTableView.footerEndRefresh()
//                    self.view.makeToast("请求数据失败")
//                }
//            })
//        }
//    }



}
