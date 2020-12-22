//
//  MapTableViewCell.swift
//  DZ10
//
//  Created by Kristina Kudinova on 16.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {

    static let identifier = "MapTableViewCell"
    @IBOutlet weak var someMap: MKMapView!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var viewForAddress: UIView!
    
   static func nib() -> UINib {
        return UINib(nibName: "MapTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(placeAddress: String) {
        self.placeAddress.text = placeAddress
        someMap.layer.masksToBounds = true
        someMap.layer.cornerRadius = 16
        viewForAddress.layer.masksToBounds = true
        viewForAddress.layer.cornerRadius = 16
        viewForAddress.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        viewForAddress.layer.borderWidth = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
