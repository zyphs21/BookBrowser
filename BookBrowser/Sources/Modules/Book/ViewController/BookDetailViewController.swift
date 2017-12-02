//
//  BookDetailViewController.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/12.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

enum BookDetailSection {
    case description
    case other
}

class BookDetailViewController: UIViewController {

    var stretchHeaderView: StretchHeaderView!
    var bookDeatilBasicView: BookDetailBasicView!
    var bookDetailHeaderView: BookDetailHeaderView!
    var tableView: UITableView!
    var navigationView: UIView!
    
    var book: Book = Book()
    
    private let stretchHeaderViewHeight: CGFloat = 128
    private let stretchHeaderStopOffset: CGFloat = 128 - UIScreen.navigationHeight
    private var heightOfHeader: CGFloat = 222
    private let heightOfBlurArea: CGFloat = 60
    private let sections: [BookDetailSection] = [.description, .other]
    
    
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
        
        stretchHeaderView = StretchHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: stretchHeaderViewHeight), blurAreaHeight: stretchHeaderViewHeight)
        if let imageUrl = URL(string: book.images.medium) {
            stretchHeaderView.backgroudImageView.kf.setImage(with: imageUrl, options: nil, progressBlock: nil, completionHandler: nil)
        }
        
        bookDeatilBasicView = BookDetailBasicView(frame: CGRect(x: 0, y: stretchHeaderViewHeight, width: UIScreen.screenWidth, height: 150))
        bookDeatilBasicView.backgroundColor = UIColor.white
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
        tableView.backgroundColor = UIColor.clear
        tableView.register(UITableViewCell.self)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.addSubview(bookDetailHeaderView)
        
//        tableView.addSubview(stretchHeaderView)
        tableView.addSubview(bookDeatilBasicView)
        
        self.view.addSubview(stretchHeaderView!)
        self.view.addSubview(tableView!)
//        self.view.addSubview(navigationView)
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension BookDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .description:
            return 1
        default:
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .description:
            let cell: UITableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.textLabel?.numberOfLines = 4
            cell.textLabel?.text = book.summary
            cell.selectionStyle = .none
            return cell
        default:
            let cell: UITableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.layoutMargins = .zero
            cell.textLabel?.text = "test"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
            cell.accessoryType = .disclosureIndicator
            return cell
        }
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
        var headerTransform = CATransform3DIdentity
        stretchHeaderView.updateOffset(contentOffsetX: offset)
        dPrint("offSet--" + "\(offset)")
        
        // pull down
        if offset < 0 {
            let headerScaleFactor: CGFloat = -(offset) / stretchHeaderViewHeight
            let headerSizevariation = ((stretchHeaderViewHeight * (1.0 + headerScaleFactor)) - stretchHeaderViewHeight)/2.0
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
            
            stretchHeaderView.layer.transform = headerTransform
            
        } else {
            headerTransform = CATransform3DTranslate(headerTransform, 0, max(-stretchHeaderStopOffset, -offset), 0)
            
            if offset <= stretchHeaderStopOffset {
                stretchHeaderView.layer.zPosition = 0
//                if avatarImage.layer.zPosition < header.layer.zPosition{
//                    header.layer.zPosition = 0
//                }
                
            } else {
//                if avatarImage.layer.zPosition >= header.layer.zPosition{
//                    header.layer.zPosition = 2
//                }
                stretchHeaderView.layer.zPosition = 2
            }
        }
        
        stretchHeaderView.layer.transform = headerTransform
        
        
//        if (offset > UIScreen.navigationHeight) {
//            self.tableView.bringSubview(toFront: stretchHeaderView)
//            stretchHeaderView.frame = CGRect(x: 0, y: offset - UIScreen.navigationHeight, width: UIScreen.screenWidth, height: 128)
//
//        } else {
//            self.tableView.bringSubview(toFront: bookDeatilBasicView)
//            stretchHeaderView.frame = CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: 128)
//        }
    }
}
