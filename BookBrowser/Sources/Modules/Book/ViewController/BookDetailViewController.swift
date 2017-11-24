//
//  BookDetailViewController.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/12.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    var stretchHeaderView: StretchHeaderView!
    var bookDeatilBasicView: BookDetailBasicView!
    var bookDetailHeaderView: BookDetailHeaderView!
    var tableView: UITableView!
    var navigationView: UIView!
    
    var book: Book = Book()
    
    private var heightOfHeader: CGFloat = 222
    private let heightOfBlurArea: CGFloat = 60
    
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        setUpView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}


// MARK: - Function

extension BookDetailViewController {
    
    private func setUpView() {
//        navigationView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.navigationHeight))
//        navigationView.backgroundColor = UIColor.white
//        navigationView.alpha = 0.0
//        navigationView.isHidden = true
        
        stretchHeaderView = StretchHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: 128), blurAreaHeight: 128)
        if let imageUrl = URL(string: book.images.medium) {
            stretchHeaderView.backgroudImageView.kf.setImage(with: imageUrl, options: nil, progressBlock: nil, completionHandler: nil)
        }
        
        bookDeatilBasicView = BookDetailBasicView(frame: CGRect(x: 0, y: stretchHeaderView.frame.maxY, width: UIScreen.screenWidth, height: 150))
        bookDeatilBasicView.configureHeader(book: book)
        
//        bookDetailHeaderView = BookDetailHeaderView()
//        bookDetailHeaderView.frame = CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: bookDetailHeaderView.heightOfHeader)
//        bookDetailHeaderView.configureHeader(book: book)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight))
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: 278))
        tableView.register(UITableViewCell.self)
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.addSubview(bookDetailHeaderView)
        tableView.addSubview(stretchHeaderView)
        tableView.addSubview(bookDeatilBasicView)
        
        self.view.addSubview(tableView!)
//        self.view.addSubview(navigationView)
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension BookDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.layoutMargins = .zero
        cell.textLabel?.text = "test"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}


// MARK: - ScrollView Delegate

extension BookDetailViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset: CGFloat = scrollView.contentOffset.y
        stretchHeaderView.updateOffset(contentOffsetX: offset)
        dPrint("offSet--" + "\(offset)")
        if (offset > BBConstant.navigationHeight) {
            self.tableView.bringSubview(toFront: stretchHeaderView)
            stretchHeaderView.frame = CGRect(x: 0, y: offset - BBConstant.navigationHeight, width: UIScreen.screenWidth, height: 128)
            
        } else {
            self.tableView.bringSubview(toFront: bookDeatilBasicView)
            stretchHeaderView.frame = CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: 128)
        }
    }
}
