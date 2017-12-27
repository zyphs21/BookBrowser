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
    
    lazy var awareButton: UIBarButtonItem = {
        let awareButton = UIButton(frame: CGRect(x: 0, y: 0, width: 62, height: 18))
        awareButton.setTitle("扫描", for: .normal)
        awareButton.setTitleColor(UIColor.hs.mainBlack, for: .normal)
        awareButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        awareButton.addTarget(self, action: #selector(toExplain), for: .touchUpInside)
        let awareBarButtonItem = UIBarButtonItem(customView: awareButton)
        return awareBarButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor.hs.backgroundColor
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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.rightBarButtonItem = awareButton
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
    
    @objc private func toExplain() {
        let controller = BarcodeScannerController()
        controller.codeDelegate = self
        controller.errorDelegate = self
        controller.dismissalDelegate = self
        present(controller, animated: true, completion: nil)
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
        dPrint(bookList.books[indexPath.row].id)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let bookDetailVC = BookDetailViewController()
        bookDetailVC.book = bookList.books[indexPath.row]
        self.navigationController?.pushViewController(bookDetailVC, animated: true)
        
    }
}

extension HomeViewController: BarcodeScannerCodeDelegate {
    
    func barcodeScanner(_ controller: BarcodeScannerController, didCaptureCode code: String, type: String) {
        dPrint("扫描结果：" + code)
        let requestTarget = BookApi.bookISBN(isbn: code)
        ApiOperation.requestJSON(with: requestTarget) { [weak self] (json) in
            guard let strongSelf = self else { return }
            if let json = json {
                let book = Book.getBook(json)
                controller.dismiss(animated: true, completion: {
                    let bookVC = BookDetailViewController()
                    bookVC.book = book
                    strongSelf.navigationController?.pushViewController(bookVC, animated: true)
                })
            }
        }
        
    }
}

extension HomeViewController: BarcodeScannerErrorDelegate {
    
    func barcodeScanner(_ controller: BarcodeScannerController, didReceiveError error: Error) {
        print(error)
    }
}

extension HomeViewController: BarcodeScannerDismissalDelegate {
    
    func barcodeScannerDidDismiss(_ controller: BarcodeScannerController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
