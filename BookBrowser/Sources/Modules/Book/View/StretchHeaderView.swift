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
    var contentSize = CGSize.zero
    
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentSize = CGSize(width: frame.width, height: frame.height)
        
        backgroudImageView = UIImageView(frame: frame)
        backgroudImageView.clipsToBounds = true
        backgroudImageView.contentMode = .scaleAspectFill
        backgroudImageView.isUserInteractionEnabled = true
        backgroudImageView.image = UIImage.renderImageWithColor(UIColor.cyan, size: frame.size)
        addSubview(backgroudImageView)
        
        effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        effectView.frame = backgroudImageView.bounds
        backgroudImageView.addSubview(effectView)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Function
    
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
