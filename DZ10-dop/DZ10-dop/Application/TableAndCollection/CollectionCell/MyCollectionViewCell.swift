//
//  MyCollectionViewCell.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 26.01.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyCollectionViewCell"
    @IBOutlet var myImageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    func setupCell(with image: UIImage) {
        myImageView.image = image
        myImageView.layer.cornerRadius = 10
        myImageView.clipsToBounds = true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
