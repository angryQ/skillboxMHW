//
//  HorizontalAndVerticalScrollViewController.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 19.01.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import UIKit

class HorizontalAndVerticalScrollViewController: UIViewController {
    
    var verticalScrollView: UIScrollView!
    var horizontalScrollView: UIScrollView!
    let viewPadding: CGFloat = 10
    var notScrolledView =  UIView()
    var xOffset: CGFloat = 10
    var startY: CGFloat = 30
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verticalScrollView = UIScrollView(frame: CGRect(x: 0, y: startY, width: view.bounds.width, height: view.frame.height))
        view.addSubview(verticalScrollView)
        addHorizontalScrollWithViews()
        notScrolledView.frame = CGRect(x: 15, y: startY, width: view.bounds.width - 30, height: 150)
        notScrolledView.layer.cornerRadius = 10
        notScrolledView.backgroundColor = UIColor.cyan
        verticalScrollView.addSubview(notScrolledView)
        
        startY += notScrolledView.frame.height + viewPadding * 2
        
        addHorizontalScrollWithViews()
        addHorizontalScrollWithViews()
        addHorizontalScrollWithViews()
        addHorizontalScrollWithViews()
    }
    func addHorizontalScrollWithViews() {
        horizontalScrollView = UIScrollView(frame: CGRect(x: 0, y: startY, width: view.bounds.width, height: 150))
        startY += horizontalScrollView.frame.height + viewPadding * 2
        verticalScrollView.addSubview(horizontalScrollView)
        
        horizontalScrollView.backgroundColor = UIColor.clear
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0...10 {
            let myView = UIView()
            myView.backgroundColor = UIColor.systemPink
            myView.layer.cornerRadius = 10
            myView.frame = CGRect(x: xOffset+10, y: CGFloat(viewPadding), width: 100, height: horizontalScrollView.frame.height-10)
            
            xOffset = xOffset + CGFloat(viewPadding) + myView.frame.size.width
            horizontalScrollView.addSubview(myView)
        }
        
        horizontalScrollView.contentSize = CGSize(width: xOffset, height: horizontalScrollView.frame.height)
        xOffset = 0
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        verticalScrollView.contentSize = CGSize(width: view.frame.width, height: startY + 50)
    }
}
