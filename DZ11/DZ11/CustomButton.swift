//
//  CustomButton.swift
//  DZ11
//
//  Created by Kristina Kudinova on 23.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIView {
    let recognizer = UITapGestureRecognizer()
    
    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = true
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            if let color = borderColor {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @objc func buttonTapped(_ gestureRecognizer: UITapGestureRecognizer) {
          print("Hello!")
       }
    
    override func draw(_ rect: CGRect) {
        let buttonLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        buttonLabel.text = "Button title"
        buttonLabel.textAlignment = .center
        buttonLabel.textColor = .darkGray
        addSubview(buttonLabel)
        
        recognizer.addTarget(self, action: #selector(buttonTapped(_:)))
        self.addGestureRecognizer(recognizer)
       }
}
