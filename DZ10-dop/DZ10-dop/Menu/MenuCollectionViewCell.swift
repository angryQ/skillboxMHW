//
//  MenuCollectionViewCell.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 12.03.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var menuItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class var reuseIdentifier: String {
        return "MenuCollectionViewCellReuseIdentifier"
    }
    class var nibName: String {
        return "MenuCollectionViewCell"
    }
    
    func configureCell(cellText: String) {
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = #colorLiteral(red: 0.4078431373, green: 0.7333333333, blue: 0.7803921569, alpha: 0.3151220034)
        
        self.menuItemLabel.textColor = .black
        self.menuItemLabel.text = cellText
    }
    
    func isHighlightedCell() {
        self.backgroundColor = .orange
        self.menuItemLabel.textColor = .black
    }
    
    func selectCell() {
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = #colorLiteral(red: 0.4078431373, green: 0.7333333333, blue: 0.7803921569, alpha: 1)
        self.menuItemLabel.textColor = .black
    }
    
    func deselectCell() {
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = #colorLiteral(red: 0.4078431373, green: 0.7333333333, blue: 0.7803921569, alpha: 0.3151220034)
        self.menuItemLabel.textColor = .black
    }
}
