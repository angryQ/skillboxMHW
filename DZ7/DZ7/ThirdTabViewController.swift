//
//  ThirdTabViewController.swift
//  DZ7
//
//  Created by Kristina Kudinova on 25.08.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit


//Протокол с требованиями делегатору
protocol ThirdTabControllerDelegate {
    func setBackgroundColorInMainVC(_ color: UIColor)
}

class ThirdTabViewController: UIViewController {
    
    var delegate: ThirdTabControllerDelegate? //делегат класса ThirdTabViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Реализация действий на нажатие кнопок на третьей табе, которые меняют цвет бэкграунда родительского view controller'a
    @IBAction func setGreenColor(_ sender: Any) {
        changeBackgroundColorInParentVC(color: UIColor.green)
    }
    @IBAction func setYellowColor(_ sender: Any) {
       changeBackgroundColorInParentVC(color: UIColor.yellow)
    }
    @IBAction func setPurpleColor(_ sender: Any) {
        changeBackgroundColorInParentVC(color: UIColor.purple)
    }
    
    //Функция для изменения цвета бэкграунда у родительского view controller'a на третьей вкладке
    private func changeBackgroundColorInParentVC(color: UIColor) {
        if let unwrappedContainerToMainVC = delegate {
            unwrappedContainerToMainVC.setBackgroundColorInMainVC(color)
        }
    }
}
//Класс ThirdTabViewController является делегатом для класса ViewController. Принимаем и реализуем потребности класса ViewController
extension ThirdTabViewController: ViewControllerDelegate {
    func setBackgroundColorInEmbededVC(_ color: UIColor) {
        self.view.backgroundColor = color
    }
}
