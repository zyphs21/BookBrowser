//
//  DiscoverPageViewController.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/29.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class DiscoverPageViewController: UIViewController {
    // , UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate
////    @IBOutlet weak var searchBarView: UIView!
//
//    @IBOutlet weak var searchBar: UISearchBar!
//
//    @IBOutlet weak var tableView: UITableView!
//
//    var books = [Book]()
////    var bookSearchController: BookSearchController!
//
//    var searchTitles = [String]()
////    var searchController = UISearchController()
//
//
//    // MARK: -  View Life Cycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        bookSearchController = storyboard?.instantiateViewControllerWithIdentifier("BookSearchController") as! BookSearchController
////        searchBarView.addSubview(bookSearchController.searchController.searchBar)
//        tableView.dataSource = self
//        tableView.delegate = self
//        searchBar.delegate = self
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//
//    // MARK: - UITableViewDataSource
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return searchTitles.count
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("searchcell", forIndexPath: indexPath)
//        cell.textLabel!.text = searchTitles[indexPath.row]
//        return cell
//    }
//
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        searchBar.resignFirstResponder()
//        searchBar.showsCancelButton = false
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewControllerWithIdentifier("BookDetailViewController") as! BookDetailViewController
//        let book = books[indexPath.row]
//        viewController.book = book
//        navigationController?.pushViewController(viewController, animated: true)
//    }
//
//
//    // MARK: - UISearchBarDelegate
//
//    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
//        NetManager.getBookList(searchText, page: 0, resultClosure: { (result, books) -> Void in
//            if result {
//                self.books = books
//                self.searchTitles.removeAll()
//                for book in books{
//                    self.searchTitles.append(book.title)
//                }
//                self.tableView.reloadData()
//            } else {
//                //self.view.makeToast("请求数据失败")
//            }
//        })
//    }
//
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//        searchBar.showsCancelButton = false
//    }
//
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//        searchBar.showsCancelButton = false
//        self.searchTitles.removeAll()
//        self.tableView.reloadData()
//    }
//
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        searchBar.showsCancelButton = true
//    }

}
