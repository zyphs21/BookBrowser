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
    
    var description: String {
        switch self {
        case .description: return "简介"
        default: return "评论"
        }
    }
}

class BookDetailViewController: UIViewController {

    var stretchHeaderView: StretchHeaderView!
    var bookDeatilBasicView: BookDetailBasicView!
    var tableView: UITableView!
    
    var book: Book = Book()
    var reviews: [Review] = []
    
    private let stretchHeaderViewHeight: CGFloat = 128
    private let stretchHeaderStopOffset: CGFloat = 128 - UIScreen.navigationHeight
    private let heightOfBookDetailBasicView: CGFloat = 110
    private var heightOfHeader: CGFloat {
        return stretchHeaderViewHeight + heightOfBookDetailBasicView
    }
    private let heightOfBlurArea: CGFloat = 60
    private let sections: [BookDetailSection] = [.description, .other]
    
    
    lazy var backButton: UIButton = { [unowned self] in
        let button = UIButton()
        button.addTarget(self, action: #selector(naviBack), for: .touchUpInside)
        button.setImage(UIImage(named: "icon_back_white"), for: .normal)
        button.layer.cornerRadius = 15
        button.layer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
        
        return button
    }()
    
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        setUpView()
        getReviews()
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
        stretchHeaderView = StretchHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: stretchHeaderViewHeight), blurAreaHeight: stretchHeaderViewHeight)
        stretchHeaderView.label.text = book.title
        if let imageUrl = URL(string: book.images.medium) {
            stretchHeaderView.backgroudImageView.kf.setImage(with: imageUrl, options: nil, progressBlock: nil, completionHandler: nil)
        }
        self.view.addSubview(stretchHeaderView!)
        
        bookDeatilBasicView = BookDetailBasicView(frame: CGRect(x: 0, y: stretchHeaderViewHeight, width: UIScreen.screenWidth, height: heightOfBookDetailBasicView))
        bookDeatilBasicView.backgroundColor = UIColor.white
        bookDeatilBasicView.configureHeader(book: book)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight))
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: heightOfHeader))
        tableView.backgroundColor = UIColor.clear
        tableView.register(BookCommentCell.self)
        tableView.register(UITableViewCell.self)
        tableView.registerHeaderFooter(BookDetailSectionHeaderView.self)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.addSubview(bookDeatilBasicView)
        self.view.addSubview(tableView!)
        
        backButton.layer.zPosition = 4
        let buttonY = UIScreen.navigationHeight - 44 + (44-30)/2
        self.view.addSubview(backButton)
        backButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.top.equalTo(buttonY)
            make.left.equalTo(15)
        }
    }
    
    @objc private func naviBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func getReviews() {
        let reviewsTarget = BookApi.review(id: book.id, start: 0, count: 15)
        ApiOperation.requestJSON(with: reviewsTarget) { [weak self] (json) in
            guard let strongSelf = self, let json = json else {
                return
            }
            dPrint(json.description)
            strongSelf.reviews = Review.getReviews(json: json)
            strongSelf.tableView.reloadData()
        }
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
            return reviews.count
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
            let cell: BookCommentCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configureCell(review: reviews[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: BookDetailSectionHeaderView = tableView.dequeueReusableHeaderFooter()
        header.sectionTitle.text = sections[section].description
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
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
        var bookCoverTransform = CATransform3DIdentity
        dPrint("offSet--" + "\(offset)")
        
        stretchHeaderView.updateOffset(contentOffsetY: offset)
        
        if offset <= 0 {
            headerTransform = CATransform3DTranslate(headerTransform, 0, -offset, 0)
            stretchHeaderView.layer.transform = headerTransform
            stretchHeaderView.clipsToBounds = false

        } else {
            stretchHeaderView.clipsToBounds = true // 为了解决顶部题目label在向上滑动时候下面一半不被展示出来
            headerTransform = CATransform3DTranslate(headerTransform, 0, max(-stretchHeaderStopOffset, -offset), 0)
            
            let labelTransform = CATransform3DMakeTranslation(0, max(-30, UIScreen.navigationHeight - offset), 0)
            stretchHeaderView.label.layer.transform = labelTransform
            
            let bookCoverScaleFactor = (min(stretchHeaderStopOffset, offset)) / BookDetailBasicView.bookCoverHeight / 1.2
            let bookCoverTranslateFactor = BookDetailBasicView.bookCoverHeight * bookCoverScaleFactor / 2.0
            bookCoverTransform = CATransform3DTranslate(bookCoverTransform, 0, bookCoverTranslateFactor, 0)
            bookCoverTransform = CATransform3DScale(bookCoverTransform, 1.0 - bookCoverScaleFactor, 1.0 - bookCoverScaleFactor, 1)
            
            if offset < stretchHeaderStopOffset {
                tableView.layer.zPosition = 1
                stretchHeaderView.layer.zPosition = 0

            } else {
                tableView.layer.zPosition = 0
                stretchHeaderView.layer.zPosition = 1
            }
            
        }
        
        stretchHeaderView.layer.transform = headerTransform
        bookDeatilBasicView.bookCover.layer.transform = bookCoverTransform
        
    }
}
