//
//  SettingTableViewCell.swift
//  DZ10
//
//  Created by Kristina Kudinova on 29.11.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
        {
        didSet {
            
        }
    }
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var settingImage: UIImageView! {
        didSet {
            settingImage.layer.masksToBounds = true
            settingImage.clipsToBounds = true
            settingImage.layer.cornerRadius = 5
        }
    }
}
