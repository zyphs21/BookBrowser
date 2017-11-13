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
    var avatarView: UIImageView!
    var name: UILabel!
    var signature: UILabel!
    var contentSize = CGSize.zero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentSize = CGSize(width: frame.width, height: frame.height)
        
        backgroudImageView = UIImageView(frame: frame)
        backgroudImageView.clipsToBounds = true
        backgroudImageView.contentMode = .scaleAspectFill
        backgroudImageView.isUserInteractionEnabled = true
        backgroudImageView.image = UIImage(named: "user_backgroud")
        addSubview(backgroudImageView)
        
        effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        effectView.frame = backgroudImageView.bounds
        backgroudImageView.addSubview(effectView)
        
        avatarView = UIImageView()
        avatarView.layer.cornerRadius = 35
        avatarView.image = UIImage(named: "avatar_def")
        avatarView.clipsToBounds = true
        avatarView.isUserInteractionEnabled = true
        addSubview(avatarView)
        
        name = UILabel()
        name.text = "登录/注册"
        name.textColor = UIColor.white
        name.font = UIFont.systemFont(ofSize: 16)
        name.isUserInteractionEnabled = true
        addSubview(name)
        
        signature = UILabel()
        signature.textColor = UIColor.white
        signature.font = UIFont.systemFont(ofSize: 14)
        signature.numberOfLines = 2
        signature.textAlignment = .center
        addSubview(signature)
        
        avatarView.snp.makeConstraints { (make) in
            make.width.height.equalTo(70)
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(70)
        }
        name.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(avatarView.snp.bottom).offset(10)
        }
        signature.snp.makeConstraints { (make) in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateOffset(contentOffsetX: CGFloat) {
        
        if contentOffsetX < 0 {
            backgroudImageView.frame = CGRect(x: contentOffsetX ,y: contentOffsetX, width: contentSize.width - (contentOffsetX * 2) , height: contentSize.height - contentOffsetX)
            effectView.frame = backgroudImageView.bounds
        } else {
            backgroudImageView.frame = CGRect(x: 0, y: 0, width: contentSize.width, height: contentSize.height)
            effectView.frame = backgroudImageView.bounds
        }
    }
}
