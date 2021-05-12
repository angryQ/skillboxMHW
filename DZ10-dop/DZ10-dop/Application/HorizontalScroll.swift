//
//  HorizontalScroll.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 19.01.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import UIKit

class HorizontalScroll: UIView {
    
    var imageViews = [UIImageView]()
    var scrollView = UIScrollView()
    let padding: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView.isPagingEnabled = true
        self.addSubview(scrollView)
        let imageCollection = ImageCollection.nature
        
        //Добавляем картинки на scrollView
        for image in imageCollection.images {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            scrollView.addSubview(imageView)
            imageViews.append(imageView)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        //Устанавливаем размеры и координаты для картинок
        for (index, imageView) in imageViews.enumerated() {
            imageView.frame.size = CGSize(width: self.frame.width - padding * 2, height: self.frame.height)
            imageView.frame.origin.x = scrollView.frame.width * CGFloat(index) + padding
            imageView.frame.origin.y = self.frame.origin.y
        }
        let contentWidth = scrollView.frame.width * CGFloat(imageViews.count)
        scrollView.contentSize = CGSize(width: contentWidth, height: self.frame.height)
    }
}
