//
//  ReviewTableViewCell.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/14.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentDateLabel: UILabel!
    @IBOutlet weak var commentDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureWithReview(review:Review) {
        
        userImage.sd_setImageWithURL(NSURL(string: review.author.avatar))
        titleLabel.text = review.title
        userNameLabel.text = review.author.name
        commentDetailLabel.text = review.summary
        commentDateLabel.text = review.updated
        
        //        if let rating = review.rating {
        //            RatingView.showInView(viewRatingContent, value: rating.average)
        //            labelRatingNum.text = Int(rating.numRaters).description
        //        } else {
        //            RatingView.showNoRating(viewRatingContent)
        //        }
    }
}
