//
//  ImageSwitchViewController.swift
//  DZ8-additional
//
//  Created by Kristina Kudinova on 09.11.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ImageSwitchViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let transfrom = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
        activityIndicator.transform = transfrom
    }

    @IBAction func changeOpacity(_ sender: UISwitch) {
        if sender.isOn {
            image.alpha = 1
            activityIndicator.stopAnimating()
        }
        else {
            image.alpha = 0.3
            activityIndicator.startAnimating()
        }
    }
}
