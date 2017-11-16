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
    var tableView: UITableView!
    var navigationView: UIView!
    
    var book: Book = Book()
    
    
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
        navigationView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.navigationHeight))
        navigationView.backgroundColor = UIColor.white
        navigationView.alpha = 0.0
        
        stretchHeaderView = StretchHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: 222), blurAreaHeight: 111)
        
        let bookCover = UIImageView()
        bookCover.layer.shadowColor = UIColor(rgba: "#CCCCCC").cgColor
        bookCover.layer.shadowOpacity = 1
        bookCover.layer.shadowRadius = 8
        bookCover.layer.shadowOffset = CGSize.zero
        stretchHeaderView.addSubview(bookCover)
        bookCover.snp.makeConstraints { (make) in
            make.centerY.equalTo(stretchHeaderView)
            make.left.equalTo(20)
            make.height.equalTo(142)
            make.width.equalTo(100)
        }
        
        if let imageUrl = URL(string: book.images.medium) {
            stretchHeaderView.backgroudImageView.kf.setImage(with: imageUrl, options: nil, progressBlock: nil, completionHandler: nil)
            bookCover.kf.setImage(with: imageUrl, options: nil, progressBlock: nil, completionHandler: nil)
        }
        
        let bookName = UILabel()
        bookName.text = book.title
        bookName.textColor = UIColor.mainBlack
        stretchHeaderView.addSubview(bookName)
        bookName.snp.makeConstraints { (make) in
            make.top.equalTo(bookCover.snp.centerY).offset(5)
            make.left.equalTo(bookCover.snp.right).offset(20)
        }
        
        let bookAuthor = UILabel()
        bookAuthor.text = book.author.joined(separator: ",")
        bookAuthor.textColor = UIColor.minorBlack
        bookAuthor.font = UIFont.systemFont(ofSize: 14)
        stretchHeaderView.addSubview(bookAuthor)
        bookAuthor.snp.makeConstraints { (make) in
            make.top.equalTo(bookName.snp.bottom).offset(8)
            make.left.equalTo(bookCover.snp.right).offset(20)
        }
        
        let rateHolderView = UIView()
            .hs.adhere(toSuperView: stretchHeaderView)
            .hs.layout(snapKitMaker: { (make) in
                make.height.equalTo(12)
                make.width.equalTo(68)
                make.top.equalTo(bookAuthor.snp.bottom).offset(5)
                make.left.equalTo(bookAuthor.snp.left)
            })
        let rate = UILabel()
            .hs.adhere(toSuperView: stretchHeaderView)
            .hs.config({ (label) in
                label.font = UIFont.systemFont(ofSize: 10)
                label.textColor = UIColor(rgba: "#DF912B")
            })
            .hs.layout(snapKitMaker: { (make) in
                make.centerY.equalTo(rateHolderView)
                make.left.equalTo(rateHolderView.snp.right).offset(4)
            })
        RatingView.showInView(view: rateHolderView, value: book.rating.average/2)
        rate.text = String(book.rating.average)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight))
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = stretchHeaderView
        tableView.register(UITableViewCell.self)
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView!)
        self.view.addSubview(navigationView)
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension BookDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.layoutMargins = .zero
        cell.textLabel?.text = ""
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
        if (offset > 50) {
            //let alpha: CGFloat = min(CGFloat(1), CGFloat(1) - (CGFloat(50) + (navigationView.frame.height) - offset) / (navigationView.frame.height))
            let alpha: CGFloat = min(CGFloat(1), (offset - 50) / (navigationView.frame.height))
            navigationView.alpha = CGFloat(alpha)
            
        } else {
            navigationView.alpha = 0.0
        }
    }
}
