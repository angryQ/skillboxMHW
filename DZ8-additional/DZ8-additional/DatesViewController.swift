//
//  DatesViewController.swift
//  DZ8-additional
//
//  Created by Kristina Kudinova on 06.11.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class DatesViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timeZoneTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = DateFormatter().string(for: NSDate())
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        self.view.addGestureRecognizer(tapGesture)
        datePicker.locale = .current
    }
    @objc func tapGestureDone() {
        getDateFromPicker()
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        getDateFromPicker()
    }
    
    func getDateFromPicker() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "d MMMM, YYYY HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT" + timeZoneTextField.text!)
        let strDate = dateFormatter.string(from: datePicker.date as Date)
        resultLabel.text = strDate
    }
}

