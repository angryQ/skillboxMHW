//
//  ActionButtonsTableViewCell.swift
//  DZ10
//
//  Created by Kristina Kudinova on 16.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ActionButtonsTableViewCell: UITableViewCell {

    static let identifier = "ActionButtonsTableViewCell"
    
    @IBOutlet weak var createEventButton: UIButton!
    @IBOutlet weak var orderTakeOutButton: UIButton!
    
    static func nib() -> UINib {
        return UINib(nibName: "ActionButtonsTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure() {
        //createEventButton.translatesAutoresizingMaskIntoConstraints = false
        createEventButton.layer.cornerRadius = 10
        createEventButton.layer.borderColor = #colorLiteral(red: 0.1215686275, green: 0.662745098, blue: 0.1764705882, alpha: 1)
        createEventButton.layer.borderWidth = 2
        
        orderTakeOutButton.layer.cornerRadius = 10
        orderTakeOutButton.layer.borderColor = #colorLiteral(red: 0.1215686275, green: 0.662745098, blue: 0.1764705882, alpha: 1)
        orderTakeOutButton.layer.borderWidth = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
