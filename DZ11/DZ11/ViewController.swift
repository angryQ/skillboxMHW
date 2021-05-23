//
//  ViewController.swift
//  DZ11
//
//  Created by Kristina Kudinova on 23.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selSegment = ""
    
    @IBOutlet weak var clockView: ClockView!
    @IBOutlet weak var customSegmentedControl: CustomSegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customSegmentedControl.delegate = self
        clockView.start()
    }
}

extension ViewController: CustomSegmentedControlDelegate {
    func getSelectedSegment(selectedSegment: String) {
        selSegment = selectedSegment
        print("Выбран сегмент: \(selSegment)")
    }
}
