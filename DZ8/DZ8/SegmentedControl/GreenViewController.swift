//
//  GreenViewController.swift
//  DZ8
//
//  Created by Kristina Kudinova on 23.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet weak var test2TextField: UITextField!
    @IBOutlet weak var testTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
