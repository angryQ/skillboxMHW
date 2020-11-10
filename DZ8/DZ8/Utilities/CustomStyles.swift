//
//  Constants.swift
//  DZ8
//
//  Created by Kristina Kudinova on 17.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    static let darkPurple = UIColor(red: 0.12, green: 0.16, blue: 0.38, alpha: 1)
    static let lightGreen = #colorLiteral(red: 0.1411764706, green: 0.8705882353, blue: 0.6784313725, alpha: 1)
    static let darkBlue = #colorLiteral(red: 0.02745098039, green: 0.2156862745, blue: 0.3882352941, alpha: 1)
    static let lightGray = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
    static let orange = #colorLiteral(red: 1, green: 0.4666666667, blue: 0.3294117647, alpha: 1)
    static let purple = #colorLiteral(red: 0.1921568627, green: 0.1490196078, blue: 0.3176470588, alpha: 1)
    static let darkGray = #colorLiteral(red: 0.5137254902, green: 0.5098039216, blue: 0.6039215686, alpha: 1)
    static let lightGray2 = #colorLiteral(red: 0.9019607843, green: 0.8941176471, blue: 0.9019607843, alpha: 1)
    static let backgroundColor = lightGray
}
struct Fonts {
    static let medium = "AvenirNext-Medium"
    static let regular = "AvenirNext-Regular"
}
class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
    func setupButton() {
        styleButton()
        sizeButton()
    }
    
    func styleButton() {
        setTitleColor(Colors.lightGray2, for: .normal)
        backgroundColor = Colors.orange
        titleLabel?.font = UIFont(name: Fonts.medium, size: 14)
        layer.cornerRadius = 10
    }
    func sizeButton() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

class CustomBigButton: CustomButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func sizeButton() {
        translatesAutoresizingMaskIntoConstraints = false
        //widthAnchor.constraint(greaterThanOrEqualToConstant: UIScreen.main.bounds.width / 2 - 40).isActive = true
        heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

class CustomSegmentedControl: UISegmentedControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        styleControl()
        sizeControl()
    }
    
    func styleControl(){
        
        selectedSegmentIndex = 0

        layer.backgroundColor = Colors.darkGray.cgColor
        layer.borderColor = Colors.darkGray.cgColor
        layer.cornerRadius = 10
        layer.borderWidth = 1.5
        
        setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name:
            Fonts.medium, size: 14)!, NSAttributedString.Key.foregroundColor: Colors.lightGray2], for: .normal)
        setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: Fonts.medium, size: 14)!,
                                NSAttributedString.Key.foregroundColor: Colors.darkGray], for: .selected)
        
    }
    func sizeControl() {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
        
    }
    
}
