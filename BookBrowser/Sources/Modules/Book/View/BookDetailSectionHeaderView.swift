//
//  BookDetailSectionHeaderView.swift
//  BookBrowser
//
//  Created by Hanson on 2017/12/11.
//  Copyright © 2017年 hanson. All rights reserved.
//

import UIKit

class BookDetailSectionHeaderView: UITableViewHeaderFooterView {

    var markView: UIView!
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
        markView = UIView()
            .hs.adhere(toSuperView: contentView)
            .hs.config({ (view) in
                view.backgroundColor = UIColor.blue
            })
            .hs.layout { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview()
                make.width.equalTo(10)
                make.height.equalTo(20)
            }
        sectionTitle = UILabel()
            .hs.adhere(toSuperView: contentView)
            .hs.config({ (label) in
                label.font = UIFont.systemFont(ofSize: 13)
                label.textColor = UIColor.hs.minorBlack
            })
            .hs.layout(snapKitMaker: { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(markView.snp.right).offset(8)
            })
    }
}
