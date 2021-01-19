//
//  CustomSegmentedControl.swift
//  DZ11
//
//  Created by Kristina Kudinova on 28.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit
protocol CustomSegmentedControlDelegate {
    func getSelectedSegment(selectedSegment: String)
}
@IBDesignable class CustomSegmentedControl: UIView {
    
    var buttons = [UIButton]()
    var firstSegmentButton = UIButton(type: .system)
    var secondSegmentButton = UIButton(type: .system)
    var selectedSegmentTintColor = UIView()
    var selectedSegmentText: String?
    
    var delegate: CustomSegmentedControlDelegate?
    
       // { get { return "Selected segment: \(selectedSegmentText)" }
//        //set { self.delegate = newValue}
//
    //}
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
            selectedSegmentTintColor.backgroundColor = selectorColor
        }
    }
    
    @objc func buttonTapped(button: UIButton) {
        for (btnIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(UIColor.lightGray, for: .normal)
            if btn == button {
                UIView.animate(withDuration: 0.3, animations: {
                    self.selectedSegmentTintColor.frame.origin.x = self.frame.width / CGFloat(self.buttons.count) * CGFloat(btnIndex)
                })
                 button.setTitleColor(UIColor.white, for: .normal)
                selectedSegmentText = btn.titleLabel?.text!
                print("test: \(selectedSegmentText!)")
                delegate?.getSelectedSegment(selectedSegment: selectedSegmentText!)
            }
        }
    }
    override func draw(_ rect: CGRect) {
        selectedSegmentText = "test"
        layer.cornerRadius = frame.height / 2
        
        buttons.append(firstSegmentButton)
        buttons.append(secondSegmentButton)
        for button in buttons {
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            button.setTitleColor(UIColor.lightGray, for: .normal)
        }
        buttons[0].setTitleColor(UIColor.white, for: .normal)
        
        selectedSegmentTintColor.frame = CGRect(x: 0, y: 0, width: frame.width / CGFloat(buttons.count), height: frame.height)
        selectedSegmentTintColor.layer.cornerRadius = frame.height / CGFloat(buttons.count)
        selectedSegmentTintColor.backgroundColor = selectorColor
        addSubview(selectedSegmentTintColor)
        
        let buttonsStackView = UIStackView()
        configureButtonsStackView(buttonsStackView: buttonsStackView)
    }
    
    func configureButtonsStackView(buttonsStackView: UIStackView) {
        buttonsStackView.addArrangedSubview(firstSegmentButton)
        buttonsStackView.addArrangedSubview(secondSegmentButton)
        buttonsStackView.axis = .horizontal
        buttonsStackView.spacing = 10
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.alignment = .fill
        addSubview(buttonsStackView)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: self.topAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
extension CustomSegmentedControl {
    
}
