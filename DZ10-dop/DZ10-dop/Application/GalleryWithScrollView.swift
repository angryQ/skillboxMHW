//
//  GalleryWithScrollView.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 19.01.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import UIKit

class GalleryWithScrollView: UIView {
    
    var verticalScrollView: UIScrollView = UIScrollView()
    let padding: CGFloat = 10
    var xOffset: CGFloat = 0
    var yOffset: CGFloat = 30
    let imageHeight: CGFloat = 300
    var imageWidth: CGFloat =  0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageWidth = imageHeight * 1.2
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView(){
        self.addSubview(verticalScrollView)
        configureScrollView(verticalScrollView)
        
        addHorizontalScrollWithImages(collection: ImageCollection.nature)
        addHorizontalScrollWithImages(collection: ImageCollection.animals)
        addHorizontalScrollWithImages(collection: ImageCollection.arch)
        addHorizontalScrollWithImages(collection: ImageCollection.people)
        addHorizontalScrollWithImages(collection: ImageCollection.robots)
        addHorizontalScrollWithImages(collection: ImageCollection.space)
    }
    
    //Функция для создания горизонтального скрол вью с коллекцией картинок внутри
    func addHorizontalScrollWithImages(collection: ImageCollection) {
        let scrollWidth: CGFloat = UIScreen.main.bounds.width
        
        let collectionTitleLabel = UILabel(frame: CGRect(x: padding, y: yOffset, width: 200, height: 35))
        collectionTitleLabel.text = collection.title
        collectionTitleLabel.font = .systemFont(ofSize: 24, weight: .regular)
        collectionTitleLabel.textAlignment = .left
        verticalScrollView.addSubview(collectionTitleLabel)
        yOffset += collectionTitleLabel.frame.height + padding
        
        let horizontalScrollView = UIScrollView()
        horizontalScrollView.frame = CGRect(x: 0, y: yOffset, width: scrollWidth, height: imageHeight)
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        addImagesToScrollView(images: collection.images, scrollView: horizontalScrollView)
        
        yOffset += horizontalScrollView.frame.height + padding * 2
        xOffset = (imageWidth + padding) * CGFloat(collection.images.count) + padding
        
        verticalScrollView.addSubview(horizontalScrollView)
        horizontalScrollView.contentSize = CGSize(width: xOffset, height: horizontalScrollView.frame.height)
        xOffset = 0
        verticalScrollView.contentSize = CGSize(width: self.frame.width, height: yOffset)
    }
    
    //Функция для добавления картинок на скролл вью
    private func addImagesToScrollView(images: [UIImage], scrollView: UIScrollView) {
        var xOffset: CGFloat = 0
        for image in images {
            let myImage = UIImageView(image: image)
            myImage.layer.cornerRadius = 10
            myImage.clipsToBounds = true
            myImage.frame = CGRect(x: xOffset + padding, y: 0, width: imageWidth, height: scrollView.frame.height - padding)
            myImage.contentMode = .scaleAspectFill
            
            xOffset = xOffset + padding + imageWidth
            scrollView.addSubview(myImage)
        }
    }
    
    func configureScrollView(_ scrollView: UIScrollView) {
        verticalScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
