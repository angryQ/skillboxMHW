//
//  ScrollWithStackView.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 25.01.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import UIKit

class ScrollWithStackView: UIView {
    
    var scrollView: UIScrollView = UIScrollView()
    var stackView: UIStackView = UIStackView()
    var contentView: UIView = UIView()
    let padding: CGFloat = 10
    var contentWidth: CGFloat = 0 //ширина контента - используется в contentSize скролл вью и в стэк вью
    let imageCollection = ImageCollection.robots
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        configureStackView(stackView)
        addImagesToStackView(images: imageCollection.images)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentWidth = self.frame.width * CGFloat(imageCollection.images.count)
        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.height)
        contentView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: self.frame.height)
        stackView.frame.size = CGSize(width: contentWidth - padding * 2, height: contentView.frame.height / 2)
        stackView.center.y = contentView.center.y
    }
    
    //Добавляем картинки в стэк вью
    private func addImagesToStackView(images: [UIImage]) {
        for image in images {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            stackView.addArrangedSubview(imageView)
        }
    }
    
    private func configureStackView(_ stackViewName: UIStackView) {
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = padding * 2
        stackView.frame.origin.x = padding
        stackView.layer.cornerRadius = 10
    }
}

