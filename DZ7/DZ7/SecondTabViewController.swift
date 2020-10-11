//
//  SecondTabViewController.swift
//  DZ7
//
//  Created by Kristina Kudinova on 23.08.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit


//Протокол с требованиями делегатору
protocol SecondTabControllerDelegate: AnyObject {
    func update(_ text: String)
}


class SecondTabViewController: UIViewController {
    
    var selectedColor: String = "" //свойство в котором хранится выбранный цвет
    weak var delegate: SecondTabControllerDelegate? //делегат класса SecondTabViewController
    
    @IBOutlet weak var selectedColorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedColorTextField.text = selectedColor
    }
    
    //Реализация действий на нажатие кнопок на экране SecondTabStorybord
    @IBAction func selectColor(_ sender: UIButton) {
        guard let color = Color(rawValue: sender.tag) else { return }
        change(color: color.description)
    }
    
    //Функция которая передает делегату новый цвет, а делегат передаст его предыдущей табе
    private func change(color: String) {
        dismiss(animated: true, completion: nil)
        delegate?.update(color)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
