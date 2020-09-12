//
//  ThirdTabViewController.swift
//  DZ7
//
//  Created by Kristina Kudinova on 25.08.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit


//Протокол с требованиями делегатору
protocol ThirdTabControllerDelegate: AnyObject {
    func setBackgroundColorInMainVC(_ color: UIColor)
}

class ThirdTabViewController: UIViewController {
    
    weak var delegate: ThirdTabControllerDelegate? //делегат класса ThirdTabViewController
    
    //Реализация действий на нажатие кнопок на третьей табе, которые меняют цвет бэкграунда родительского view controller'a
    @IBAction func selectColor(_ sender: UIButton) {
        guard let color = Color(rawValue: sender.tag) else { return }
        changeBackgroundColorInParentVC(color: color.rawColor)
    }
    //Функция для изменения цвета бэкграунда у родительского view controller'a на третьей вкладке
    private func changeBackgroundColorInParentVC(color: UIColor) {
            delegate?.setBackgroundColorInMainVC(color)
    }
}
//Класс ThirdTabViewController является делегатом для класса ViewController. Принимаем и реализуем потребности класса ViewController
extension ThirdTabViewController: ViewControllerDelegate {
    func setBackgroundColorInEmbededVC(_ color: UIColor) {
        self.view.backgroundColor = color
    }
}
