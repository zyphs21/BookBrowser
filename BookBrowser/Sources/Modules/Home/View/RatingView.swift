//
//  RatingView.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/14.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class RatingView: UIView {
    
    var max = 5.0 //最大评分
    var starHeight = 22.0 //星星高度
    var starSpace = 4.0 //星星间距
    var emptyImageViews = [UIImageView]()
    var fullImageViews = [UIImageView]()
    //获取的评分值
    var value = 0.0 {
        didSet {
            if value > max {
                value = max
            } else if value < 0 {
                value = 0
            }
            
            for (i,imageView) in fullImageViews.enumerated() {
                let i = Double(i)
                if value >= i + 1 {
                    imageView.layer.mask = nil
                    imageView.isHidden = false
                } else if value < i + 1 && value > i {
                    let maskLayer = CALayer()
                    maskLayer.frame = CGRect(x: 0, y: 0, width: (value - i) * Double(starHeight), height: Double(starHeight))
                    maskLayer.backgroundColor = UIColor.black.cgColor
                    imageView.layer.mask = maskLayer
                    imageView.isHidden = false
                } else {
                    imageView.layer.mask = nil
                    imageView.isHidden = true
                }
            }
        }
    }
    
    init(starHeight: Double, max: Double) {
        self.starHeight = starHeight
        self.max = max
        self.starSpace = starHeight * 0.15
        let frame = CGRect(x: 0, y: 0, width: starHeight * max + starSpace * (max - 1), height: starHeight)
        super.init(frame: frame)
        for i in 0...4 {
            let i = Double(i)
            let emptyImageView = UIImageView(image: Asset.starEmpty.image)
            let fullImageView = UIImageView(image: Asset.starFull.image)
            let frame = CGRect(x: starHeight * i + starSpace * i, y: 0, width: starHeight, height: starHeight)
            emptyImageView.frame = frame
            fullImageView.frame = frame
            emptyImageViews.append(emptyImageView)
            fullImageViews.append(fullImageView)
            addSubview(emptyImageView)
            addSubview(fullImageView)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func showInView(view: UIView,value: Double,max: Double = 5) {
        for subview in view.subviews {
            if let subview = subview as? RatingView {
                subview.value = value
                return
            }
        }
        //        let ratingView = RatingView(starHeight: Double(view.frame.height), max: max)
        let ratingView = RatingView(starHeight: Double(12), max: max)
        ratingView.isHidden = false
        view.addSubview(ratingView)
        ratingView.value = value
    }
}
