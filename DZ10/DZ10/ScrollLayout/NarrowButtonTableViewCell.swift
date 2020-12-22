//
//  NarrowButtonTableViewCell.swift
//  DZ10
//
//  Created by Kristina Kudinova on 16.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class NarrowButtonTableViewCell: UITableViewCell {

    static let identifier = "NarrowButtonTableViewCell"
    
    @IBOutlet weak var button: UIButton!
    
    static func nib() -> UINib {
        return UINib(nibName: "NarrowButtonTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(buttonText: String) {
        button.setTitle(buttonText, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = #colorLiteral(red: 0.1215686275, green: 0.662745098, blue: 0.1764705882, alpha: 1)
        button.layer.borderWidth = 2
    }
    
}
