//
//  ItemCell.swift
//  DZ8
//
//  Created by Kristina Kudinova on 14.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView! {
        didSet {
            itemImage.layer.cornerRadius = 10
            itemImage.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(item: Item) {
        
        self.itemImage.image = item.image
        self.itemNameLabel.text = item.name
    }
}
