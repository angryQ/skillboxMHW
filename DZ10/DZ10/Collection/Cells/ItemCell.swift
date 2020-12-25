//
//  Item2Cell.swift
//  DZ10
//
//  Created by Kristina Kudinova on 20.11.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView! {
        didSet {
            itemImage.layer.masksToBounds = true
            itemImage.layer.borderColor = UIColor.lightGray.cgColor
            itemImage.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var newPriceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel! {
        didSet {
            discountLabel.layer.masksToBounds = true
            discountLabel.layer.cornerRadius = 3
        }
    }
    
    func setupCell(item: Item) {
        
        let attributedString = NSMutableAttributedString.init(string: self.oldPriceLabel.text!)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
        self.oldPriceLabel.attributedText = attributedString
        self.itemImage.image = item.image
        self.itemNameLabel.text = item.name
        self.oldPriceLabel.text = "\(item.oldPrice) руб."
        self.newPriceLabel.text = "\(item.oldPrice - (item.oldPrice * (item.discount / 100))) руб."
        self.discountLabel.text = "\(item.discount) %"
    }

}
