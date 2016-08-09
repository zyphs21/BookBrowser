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
            
            for (i,imageView) in fullImageViews.enumerate() {
                let i = Double(i)
                if value >= i + 1 {
                    imageView.layer.mask = nil
                    imageView.hidden = false
                } else if value < i + 1 && value > i {
                    let maskLayer = CALayer()
                    maskLayer.frame = CGRect(x: 0, y: 0, width: (value - i) * Double(starHeight), height: Double(starHeight))
                    maskLayer.backgroundColor = UIColor.blackColor().CGColor
                    imageView.layer.mask = maskLayer
                    imageView.hidden = false
                } else {
                    imageView.layer.mask = nil
                    imageView.hidden = true
                }
            }
        }
    }
    
    init(starHeight:Double,max:Double) {
        self.starHeight = starHeight
        self.max = max
        self.starSpace = starHeight * 0.15
        let frame = CGRect(x: 0, y: 0, width: starHeight * max + starSpace * (max - 1), height: starHeight)
        super.init(frame: frame)
        for i in 0...4 {
            let i = Double(i)
            let emptyImageView = UIImageView(image: UIImage(named: "star_empty"))
            let fullImageView = UIImageView(image: UIImage(named: "star_full"))
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
    
    static func showInView(view:UIView,value:Double,max:Double = 5) {
        //view 存在 RatingView 子类
        for subview in view.subviews {
            if let subview = subview as? RatingView {
                subview.value = value
                return
            }
        }
        
        let ratingView = RatingView(starHeight: Double(view.frame.size.height), max: max)
        
        ratingView.hidden = false
        view.addSubview(ratingView)
        ratingView.value = value
        
        if let label = objc_getAssociatedObject(view, &KeyNoRating) as? UILabel {
            label.hidden = true
        }
    }
    
    static var KeyNoRating = "KeyNoRating"
    
    //没有评分，显示无评分的 label
    static func showNoRating(view:UIView) {
        for subview in view.subviews {
            if let subview = subview as? RatingView {
                subview.hidden = true
            }
        }
        var label:UILabel! = objc_getAssociatedObject(view, &KeyNoRating) as? UILabel
        if label == nil {
            label = UILabel(frame: CGRectMake(0, 0, view.frame.size.width, view.frame.size.height))
            label.font = UIFont.systemFontOfSize(13)
            view.addSubview(label)
            label.text = "暂无评分"
            objc_setAssociatedObject(view, &KeyNoRating, label, .OBJC_ASSOCIATION_ASSIGN)
        }
        label.hidden = false
    }
}
