//
//  ViewController.swift
//  DZ11
//
//  Created by Kristina Kudinova on 23.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let customSegmentedControl = CustomSegmentedControl()
    var selectedSegment = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //customSegmentedControl.delegate = self
    }
    override func viewWillLayoutSubviews() {
        customSegmentedControl.delegate = self
        print(customSegmentedControl.selectedSegmentText)
    }
}
extension ViewController: CustomSegmentedControlDelegate {
    func getSelectedSegment(selectedSegment: String) {
        print("hello: \(selectedSegment)")
        //self.selectedSegment = selectedSegment
        //print(selectedSegment)
    }
    
    
}
