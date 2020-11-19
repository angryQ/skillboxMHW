//
//  ViewController.swift
//  DZ9
//
//  Created by Kristina Kudinova on 28.10.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var orangeTextField: UITextField!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var orangeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func textChangedInTextField(_ sender: UITextField) {
        guard let unwrappedGreenLabel = greenLabel, let unwrappedOrangeLabel =  orangeLabel else { return }
        if sender.tag == 1 {
            unwrappedGreenLabel.text = sender.text
        } else {
            unwrappedOrangeLabel.text = sender.text
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

