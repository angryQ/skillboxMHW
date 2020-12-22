//
//  BannerTableViewCell.swift
//  DZ10
//
//  Created by Kristina Kudinova on 16.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class BannerTableViewCell: UITableViewCell {
    
    static let identifier = "BannerTableViewCell"
    
    @IBOutlet weak var roundedView: UIView! 
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    static func nib() -> UINib {
        return UINib(nibName: "BannerTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(placeImage: UIImage) {
        self.placeImage.image = placeImage
        roundedView.backgroundColor = .white
        roundedView.layer.masksToBounds = true
        roundedView.layer.cornerRadius = 16
        roundedView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
