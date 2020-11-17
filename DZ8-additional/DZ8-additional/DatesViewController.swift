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
        
        resultLabel.text = formatDate(date: datePicker.date)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        self.view.addGestureRecognizer(tapGesture)
    }
    @objc func tapGestureDone() {
        changeLabel()
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
       changeLabel()
    }
    
    func changeLabel() {
        guard let _ = Int(checkTextInTextField(text: timeZoneTextField.text!)) else {
            resultLabel.text = checkTextInTextField(text: timeZoneTextField.text!)
            return }
        resultLabel.text = formatDate(date: datePicker.date, timezone: TimeZone(abbreviation: "GMT" + timeZoneTextField.text!))
    }
    
    private func checkTextInTextField(text: String) -> String {
        guard let textInt = Int(text) else {return "\(formatDate(date: datePicker.date))"}
        if textInt >= -12 && textInt <= 14 {
            return text
        }
        else {
            return "Введите число от -12 до 14 (включительно)"
        }
    }
    
    private func formatDate(date: Date, timezone: TimeZone? = .current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "d MMMM, YYYY HH:mm x"
        dateFormatter.timeZone = timezone
        let strDate = dateFormatter.string(from: date as Date)
        return strDate
    }
}

