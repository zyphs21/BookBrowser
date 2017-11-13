//
//  HomeViewController.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/1.
//  Copyright © 2017年 hanson. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON

class HomeViewController: UIViewController {

    private var tableView: UITableView!
    private var bookList: BookList = BookList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.register(BookTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self.view)
        }
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Funcion

extension HomeViewController {
    
    private func loadData() {
        var param = searchBookReqParam()
        param.tag = "文学"
        let searchTarget = BookApi.search(param: param)
        let cachePathString = "search-" + param.tag
        let filePath = FileManager.getCacheDocumentPathWith(cachePathString)
        dPrint(filePath)
        if let value = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? String {
            print("get Subscribe cache success")
            let json = SwiftyJSON.JSON.init(parseJSON: value)
            bookList = BookList.getBookList(json: json)
            tableView.reloadData()
            
        } else {
            ApiOperation.requestJSON(with: searchTarget) { [weak self] (json) in
                guard let strongSelf = self else { return }
                if let json = json {
                    let isSuccess = NSKeyedArchiver.archiveRootObject(json.description, toFile: FileManager.getCacheDocumentPathWith(cachePathString))
                    dPrint(isSuccess)
                    strongSelf.bookList = BookList.getBookList(json: json)
                    strongSelf.tableView.reloadData()
                } else {
                    
                }
            }
        }
    }
}



// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BookTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureCell(book: bookList.books[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(BookDetailViewController(), animated: true)
        
    }
}
