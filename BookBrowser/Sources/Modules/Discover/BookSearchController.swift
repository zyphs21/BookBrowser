//
//  BookSearchController.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/29.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class BookSearchController: UIViewController {
// , UISearchBarDelegate, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate
//    var searchTitles = [String]()
//    var books = [Book]()
//    var searchController = UISearchController()
//    let SEARCHPLACEHOLDER = "搜索图书"
//
//    @IBOutlet weak var searchTableView: UITableView!
//
//    override func awakeFromNib() {
//        searchController = UISearchController(searchResultsController: self)
//        searchController.searchResultsUpdater = self
//        searchController.searchBar.placeholder = SEARCHPLACEHOLDER
//        searchController.searchBar.tintColor = UIColor.whiteColor()
//        searchController.searchBar.sizeToFit()
//        searchController.searchBar.layoutSubviews()
//        //searchController.searchBar.subviews[0].subviews[0].removeFromSuperview()
//    }
//
//    //MARK : - View Life Circle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        searchTableView.delegate = self
//        searchTableView.dataSource = self
//        searchController.searchBar.delegate = self
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//
//    // MARK: UISearchBarDelegate
//
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//    }
//
//
//    //MARK : - UITableViewDataSource
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return searchTitles.count
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("searchResultCell", forIndexPath: indexPath)
//        cell.textLabel!.text = searchTitles[indexPath.row]
//        return cell
//    }
//
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewControllerWithIdentifier("BookDetailViewController") as! BookDetailViewController
//        let book = books[indexPath.row]
//        viewController.book = book
//        navigationController?.pushViewController(viewController, animated: true)
//    }
//
//    //MARK : - UISearchResultsUpdating
//
//    func updateSearchResultsForSearchController(searchController: UISearchController) {
//        if let tag = searchController.searchBar.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) where !tag.isEmpty {
//
//            /*
//                NetManager.getBookTitles(tag, page: 0, resultClosure: { (titles) -> Void in
//                    self.searchTitles = titles
//                    self.searchTableView.reloadData()
//                })
//            */
//            NetManager.getBookList(tag, page: 0, resultClosure: { (result, books) -> Void in
//                if result {
//                    self.books = books
//                    self.searchTitles.removeAll()
//                    for book in books{
//                        self.searchTitles.append(book.title)
//                    }
//                    self.searchTableView.reloadData()
//                } else {
//                    self.view.makeToast("请求数据失败")
//                }
//            })
//        }
//    }
//
//
//    // MARK: - Navigation 页面跳转
//
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//
//        if(segue.identifier == "toDetailPageViewViaSearch"){
//
//            let bookDetailViewController = segue.destinationViewController as! BookDetailViewController
//            let indexPath = searchTableView.indexPathForCell(sender as! UITableViewCell)!
//            let book = books[indexPath.row]
//            bookDetailViewController.book = book
//
//        }
//    }


}
