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
        //Если введен текст или строка пуста, то вывожу дату и временя по таймзоне устройства
        guard let textInt = Int(timeZoneTextField.text!) else {
            resultLabel.text = "\(formatDate(date: datePicker.date))"
            return
        }
        
        //Устанавливала диапазон до 14, отталкиваясь от данных этого сайта: https://greenwichmeantime.com/time-zone/gmt-plus-14/
        switch textInt {
        case 0...12: resultLabel.text = formatDate(date: datePicker.date, timezone: TimeZone(abbreviation: "GMT" + "+\(textInt)"))
        case -12...(-1): resultLabel.text = formatDate(date: datePicker.date, timezone: TimeZone(abbreviation: "GMT" + "\(textInt)"))
        default:
            return resultLabel.text = "Введите число от -12 до +12 (включительно)"
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

