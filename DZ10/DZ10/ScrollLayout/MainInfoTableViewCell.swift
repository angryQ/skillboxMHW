//
//  InfoTableViewCell.swift
//  DZ10
//
//  Created by Kristina Kudinova on 15.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class MainInfoTableViewCell: UITableViewCell {

    static let identifier = "MainInfoTableViewCell"
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeType: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "MainInfoTableViewCell", bundle: nil)
    }
    public func configure(placeName: String, placeType: String, discount: Float, rate: Float) {
        let discountText = NSMutableAttributedString.init(string: "Ваша скидка \(discount)%")

        discountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                                      NSAttributedString.Key.foregroundColor: UIColor.black],
                                     range: NSMakeRange(0, 11))
        self.placeName.text = placeName
        self.placeType.text = placeType
        self.discount.attributedText = discountText
        self.rate.text = "\(rate)"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
