//
//  CustomSegmentedControl.swift
//  DZ11
//
//  Created by Kristina Kudinova on 28.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

protocol CustomSegmentedControlDelegate: class {
    func getSelectedSegment(selectedSegment: String)
}

@IBDesignable class CustomSegmentedControl: UIView {
    var buttons = [UIButton]() //массив всех кнопок сегментед контрола
    var firstSegmentButton = UIButton(type: .system)
    var secondSegmentButton = UIButton(type: .system)
    var selectedSegment = UIView() //вью для выбранного сегмента, которая будет двигаться
    weak var delegate: CustomSegmentedControlDelegate?
    
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = true
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.darkGray {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var firstSegmentTitle: String = "" {
        didSet {
            firstSegmentButton.setTitle(firstSegmentTitle, for: .normal)
        }
    }
    @IBInspectable var secondSegmentTitle: String = "" {
        didSet {
            secondSegmentButton.setTitle(secondSegmentTitle, for: .normal)
        }
    }
    @IBInspectable var selectorColor: UIColor = UIColor.darkGray {
        didSet {
            selectedSegment.backgroundColor = selectorColor
        }
    }
    
    //событие на нажатие на сегмент контрола
    @objc func buttonTapped(button: UIButton) {
        for (btnIndex, btn) in buttons.enumerated() {
            //устанавливаем всем сегментам цвет текста на неактивный серый
            btn.setTitleColor(UIColor.lightGray, for: .normal)
            //для нажатой кнопки меняем цвет текста на белый и двигаем к ней вью имитирующую активный сегмент
            if btn == button {
                UIView.animate(withDuration: 0.3, animations: {
                    self.selectedSegment.frame.origin.x = self.frame.width / CGFloat(self.buttons.count) * CGFloat(btnIndex)
                    
                })
                guard let btnText = button.titleLabel!.text else {return}
                delegate?.getSelectedSegment(selectedSegment: btnText)
                
                button.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = frame.height / 2
        buttons.append(firstSegmentButton)
        buttons.append(secondSegmentButton)
        
        //добавляем всем кнопкам событие и устанавливаем цвет текста неактивного сегмента
        for button in buttons {
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            button.setTitleColor(UIColor.lightGray, for: .normal)
        }
        
        //для первой кнопки меняем цвет текста
        buttons[0].setTitleColor(UIColor.white, for: .normal)
        guard let firstBtntnText = buttons[0].titleLabel!.text else {return}
        delegate?.getSelectedSegment(selectedSegment: firstBtntnText)
        
        //настраиваем вью, которая имитирует выбранный сегмент
        selectedSegment.frame = CGRect(x: 0, y: 0, width: self.frame.width / CGFloat(buttons.count), height: self.frame.height)
        selectedSegment.layer.cornerRadius = self.frame.height / 2
        selectedSegment.backgroundColor = selectorColor
        self.addSubview(selectedSegment)
        
        let buttonsStackView = UIStackView()
        configureButtonsStackView(buttonsStackView)
    }
    
    func configureButtonsStackView(_ buttonsStackView: UIStackView) {
        buttonsStackView.addArrangedSubview(firstSegmentButton)
        buttonsStackView.addArrangedSubview(secondSegmentButton)
        buttonsStackView.axis = .horizontal
        buttonsStackView.spacing = 10
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.alignment = .fill
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: self.topAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
