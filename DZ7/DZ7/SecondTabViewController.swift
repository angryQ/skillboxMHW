//
//  SecondTabViewController.swift
//  DZ7
//
//  Created by Kristina Kudinova on 23.08.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit


//Протокол с требованиями делегатору
protocol SecondTabControllerDelegate {
    func update(_ text: String)
}


class SecondTabViewController: UIViewController {
    
    var selectedColor: String = "" //свойство в котором хранится выбранный цвет
    //enum хранящий доступные для выбора цветаи их RawValue
    enum selectedColorSwitch: String {
        case green = "зелёный"
        case blue = "синий"
        case red = "красный"
    }
    var delegate: SecondTabControllerDelegate? //делегат класса SecondTabViewController
    
    @IBOutlet weak var selectedColorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedColorTextField.text = selectedColor
    }
    
    //Реализация действий на нажатие кнопок на экране SecondTabStorybord
    @IBAction func selectGreenColor(_ sender: Any) {
        change(color: selectedColorSwitch.green.rawValue)
    }
    @IBAction func selectBlueColor(_ sender: Any) {
        change(color: selectedColorSwitch.blue.rawValue)
    }
    @IBAction func selectRedColor(_ sender: Any) {
        change(color: selectedColorSwitch.red.rawValue)
    }
    
    //Функция которая передает делегату новый цвет, а делегат передаст его предыдущей табе
    private func change(color: String) {
        selectedColor = color
        dismiss(animated: true, completion: nil)
        guard let unwrappedDelegate = delegate else { return }
        unwrappedDelegate.update(selectedColor)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
