//
//  TaskCViewController.swift
//  DZ9
//
//  Created by Kristina Kudinova on 28.10.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class TaskCViewController: UIViewController {

    @IBOutlet weak var myButtom: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    lazy var heightOfOneLine = myLabel.font.lineHeight
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func myButtonTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        heightConstraint.constant = heightOfOneLine * (sender.isSelected ? 5 : 1)
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
}
