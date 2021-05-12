//
//  HorizontalAndVerticalScrollView.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 19.01.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import UIKit

class HorizontalAndVerticalScrollView: UIView, UIScrollViewDelegate {
    
    var verticalScrollView: UIScrollView = UIScrollView()
    var notScrolledView: UIView =  UIView()
    var notScrolledViewHeight: CGFloat = 40
    var notScrolledViewWidth: CGFloat = 250
    var yOffset: CGFloat = 0
    var xOffset: CGFloat = 0
    var horizontalScrollViewHeigth: CGFloat = 150
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        verticalScrollView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //При скролле, вью которая не должна скроллиться, будет смещаться по вертикали на
        //позицию verticalScrollView.contentOffset.y + добавляем отступ сверху 30
        notScrolledView.frame.origin.y = verticalScrollView.contentOffset.y + 30
    }
    
    private func setupView() {
        self.addSubview(verticalScrollView)
        configureScrollView(verticalScrollView)
        
        //увеличиваем стартовую позицию по игреку для следующих элементов verticalScrollView. Также добавляем отспуп 50
        //под notScrolledView, чтобы при открытии этой вью, остальные элементы отображались под notScrolledView
        yOffset = notScrolledViewHeight + 50
        
        addHorizontalScrollWithViews()
        addHorizontalScrollWithViews()
        addHorizontalScrollWithViews()
        addHorizontalScrollWithViews()
        addHorizontalScrollWithViews()
        
        addNotScrolledView()
    }
    
    private func addNotScrolledView() {
        notScrolledView.frame = CGRect(x: 10, y: 30, width: notScrolledViewWidth, height: notScrolledViewHeight)
        notScrolledView.layer.cornerRadius = 8
        notScrolledView.translatesAutoresizingMaskIntoConstraints = false
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: notScrolledViewWidth, height: notScrolledViewHeight))
        myButton.clipsToBounds = true
        myButton.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.3607843137, blue: 0.2666666667, alpha: 1)
        myButton.layer.cornerRadius = 8
        myButton.setTitle("Изменить цвет бэкграунда", for: .normal)
        myButton.addTarget(self, action: #selector(changeBackgroundColor(sender:)), for: .touchUpInside)
        notScrolledView.addSubview(myButton)
        
        verticalScrollView.addSubview(notScrolledView)
    }
    
    @objc func changeBackgroundColor(sender: UIButton) {
        sender.isSelected.toggle()
        verticalScrollView.backgroundColor = sender.isSelected ? #colorLiteral(red: 0.3058823529, green: 0.3058823529, blue: 0.3058823529, alpha: 1) : .clear
    }
    
    private func addHorizontalScrollWithViews() {
        let itemsCount = 10
        let itemWidth: CGFloat = 200
        let padding: CGFloat = 10
        let scrollWidth: CGFloat = UIScreen.main.bounds.width
        
        let horizontalScrollView = UIScrollView()
        verticalScrollView.addSubview(horizontalScrollView)
        
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        horizontalScrollView.showsHorizontalScrollIndicator = false
        horizontalScrollView.frame = CGRect(x: 0, y: yOffset, width: scrollWidth, height: horizontalScrollViewHeigth + padding)
        
        yOffset += horizontalScrollView.frame.height + padding
        
        //Добавляем в скролл вью
        for _ in 0...itemsCount {
            let myView = UIView()
            myView.backgroundColor = #colorLiteral(red: 1, green: 0.8941176471, blue: 0.6862745098, alpha: 1)
            myView.layer.cornerRadius = 10
            myView.translatesAutoresizingMaskIntoConstraints = true
            myView.frame = CGRect(x: xOffset + padding, y: padding, width: itemWidth, height: horizontalScrollViewHeigth)
            
            xOffset = xOffset + padding + itemWidth
            horizontalScrollView.addSubview(myView)
        }
        
        horizontalScrollView.contentSize = CGSize(width: xOffset + padding, height: horizontalScrollView.frame.height)
        verticalScrollView.contentSize = CGSize(width: self.frame.width, height: yOffset)
        xOffset = 0
    }
    
    private func configureScrollView(_ scrollView: UIScrollView) {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
