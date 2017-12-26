//
//  BookDetailSectionHeaderView.swift
//  BookBrowser
//
//  Created by Hanson on 2017/12/11.
//  Copyright © 2017年 hanson. All rights reserved.
//

import UIKit

class BookDetailSectionHeaderView: UITableViewHeaderFooterView {

    var topLineView: UIView!
    var sectionTitle: UILabel!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.white
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookDetailSectionHeaderView {
    
    private func setUpView() {
        topLineView = UIView()
            .hs.adhere(toSuperView: contentView)
            .hs.config({ (view) in
                view.backgroundColor = UIColor.hs.separateColor
            })
            .hs.layout { (make) in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(0.5)
            }
        sectionTitle = UILabel()
            .hs.adhere(toSuperView: contentView)
            .hs.config({ (label) in
                label.font = UIFont.systemFont(ofSize: 15)
                label.textColor = UIColor.hs.minorBlack
            })
            .hs.layout(snapKitMaker: { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(20)
            })
    }
}
