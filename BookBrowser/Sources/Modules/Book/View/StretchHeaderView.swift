//
//  StretchHeaderView.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/13.
//  Copyright © 2017年 hanson. All rights reserved.
//

import UIKit

class StretchHeaderView: UIView {

    var backgroudImageView: UIImageView!
    var effectView: UIVisualEffectView!
    var label: UILabel!
    var contentSize = CGSize.zero
    
    
    // MARK: - Initialize
    
    init(frame: CGRect, blurAreaHeight: CGFloat) {
        super.init(frame: frame)

        contentSize = CGSize(width: frame.width, height: blurAreaHeight)
        
        backgroudImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: blurAreaHeight))
        backgroudImageView.clipsToBounds = true
        backgroudImageView.contentMode = .scaleAspectFill
        backgroudImageView.isUserInteractionEnabled = true
        backgroudImageView.image = UIImage.renderImageWithColor(UIColor.cyan, size: CGSize(width: frame.width, height: blurAreaHeight))
        addSubview(backgroudImageView)
        
        effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        effectView.frame = backgroudImageView.bounds
        backgroudImageView.addSubview(effectView)
        
        label = UILabel()
        label.textColor = UIColor.white
        addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.bottom).offset(0)
        }

//        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Function
    
    func updateOffset(contentOffsetY: CGFloat) {
        if contentOffsetY < 0 {
            backgroudImageView.frame = CGRect(x: contentOffsetY ,y: contentOffsetY, width: contentSize.width - (contentOffsetY * 2) , height: contentSize.height - contentOffsetY)
            effectView.frame = backgroudImageView.bounds
        } else {
            backgroudImageView.frame = CGRect(x: 0, y: 0, width: contentSize.width, height: contentSize.height)
            effectView.frame = backgroudImageView.bounds
        }
    }
}
