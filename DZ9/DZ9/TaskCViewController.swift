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
    
    var heightOfOneLine: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel.translatesAutoresizingMaskIntoConstraints = false
        heightOfOneLine = myLabel.font.lineHeight
    }

    @IBAction func myButtonTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true {
            self.heightConstraint.constant = heightOfOneLine
            updateLabelHeight()
            UIView.animateKeyframes(withDuration: 1, delay: 0, options: .layoutSubviews, animations: {
                self.heightConstraint.constant = self.heightOfOneLine * CGFloat(5)
                self.updateLabelHeight()
            }, completion: nil)
        }
        else if sender.isSelected == false {
            heightConstraint.constant = 200
            updateLabelHeight()
        }
    }
    func updateLabelHeight() {
        self.myLabel.setNeedsUpdateConstraints()
        self.view.layoutIfNeeded()
    }
}
