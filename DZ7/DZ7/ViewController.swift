//
//  ViewController.swift
//  DZ7
//
//  Created by Kristina Kudinova on 23.08.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//


import UIKit

//Протокол с требованиями делегатору
protocol ViewControllerDelegate {
    func setBackgroundColorInEmbededVC(_ color: UIColor)
}

class ViewController: UIViewController {

    var text: String =  "Выбран зелёный" //свойство в которое будет передаваться выбранный на экране SecondTabViewController цвет
    var color: UIColor = .secondarySystemBackground //свойство в которое будет передаваться значение цвета бэкграунда для третьей табы
    var delegate: ViewControllerDelegate? //делегат класса ViewController
    //enum для хранения всех созданных segues
    enum Segues {
        static let toSecondTab = "toSecondTabStoryboard"
        static let toThirdTab = "toThirdTabStoryboard"
    }
    
    @IBOutlet weak var selectedColorLabel: UILabel! //метка на второй табе
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Устанавливаем для метки на второй табе дефолтное значение
        if let unwrappedLabel = selectedColorLabel {
            unwrappedLabel.text = text
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Если экран на который мы переходим это SecondTabViewController, то в переменную selectedColor передается текст из selectedColorLabel
        if segue.identifier == Segues.toSecondTab {
            guard let vc = segue.destination as? SecondTabViewController else { return }
            vc.modalPresentationStyle = .fullScreen
            if let unwrappedSelectedColor = selectedColorLabel.text {
                vc.selectedColor = unwrappedSelectedColor
            }
            vc.delegate = self
        }
            
            //Если экран на который мы переходим это ThirdTabViewController, то в делегат класса ViewController передается контроль над некоторым поведением классом ThirdTabViewController, а делегату класса ThirdTabViewController передается контроль над некоторым поведением классом ViewCOntroller
        else if segue.identifier == Segues.toThirdTab {
            guard let vc = segue.destination as? ThirdTabViewController else { return }
            vc.delegate = self
            self.delegate = vc
        }
    }
   //Реализация действий на нажатие кнопок на третьей табе, которые меняют цвет встроенного view controller'a
    @IBAction func setGreenColor(_ sender: Any) {
        changeBackgroundColorInEmbededVC(color: UIColor.green)
    }
    @IBAction func setYellowColor(_ sender: Any) {
        changeBackgroundColorInEmbededVC(color: UIColor.yellow)
    }
    @IBAction func setPupleColor(_ sender: Any) {
        changeBackgroundColorInEmbededVC(color: UIColor.purple)
    }
    
    //Функция для изменения цвета бэкграунда у встроенного view controller'a на третьей вкладке
    private func changeBackgroundColorInEmbededVC(color: UIColor) {
        if let unwrappedContainerViewController = delegate {
            unwrappedContainerViewController.setBackgroundColorInEmbededVC(color)
        }
    }
}
//Класс ViewController является делегатом для класса SecondTabViewController. Принимаем и реализуем потребности класса SecondTabViewController
extension ViewController: SecondTabControllerDelegate {
    func update(_ text: String) {
        selectedColorLabel.text = "Выбран цвет " + text
    }
}
//Класс ViewController является делегатом для класса ThirdTabController. Принимаем и реализуем потребности класса ThirdTabViewController
extension ViewController: ThirdTabControllerDelegate {
    func setBackgroundColorInMainVC(_ color: UIColor) {
        self.color = color
        self.view.backgroundColor = self.color
    }
}


