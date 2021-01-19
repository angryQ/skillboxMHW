//
//  HorizontalScroll.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 19.01.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import UIKit

class HorizontalScroll: UIViewController {
    
    var scrollView: UIScrollView!
    let buttonPadding: CGFloat = 10
    var xOffset: CGFloat = 10
    let items = ["Title 1", "Title 2", "Title 3", "Long title", "Title 5", "Title 6", "One more long title", "Title 8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 50))
        view.addSubview(scrollView)
        
        scrollView.backgroundColor = UIColor.clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        for i in items {
            let button = UIButton()
            button.backgroundColor = UIColor.clear
            button.setTitleColor(UIColor.orange, for: .normal)
            button.setTitle("\(i)", for: .normal)
            button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: CGFloat(i.count + 10), height: 30)
            button.sizeToFit()
            //button.addTarget(self, action: #selector(btnTouch), for: UIControlEvents.touchUpInside)
            
            let border = CALayer()
            border.backgroundColor = UIColor.orange.cgColor
            border.frame = CGRect(x: 0 ,y: button.frame.height, width: button.frame.width, height: 2)
            button.layer.addSublayer(border)
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            scrollView.addSubview(button)
        }
        
        scrollView.contentSize = CGSize(width: xOffset, height: scrollView.frame.height)
    }
}
