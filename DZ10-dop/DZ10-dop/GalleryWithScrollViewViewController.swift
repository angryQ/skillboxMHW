//
//  GalleryWithScrollViewViewController.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 19.01.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import UIKit

class GalleryWithScrollViewViewController: UIViewController {
    var verticalScrollView: UIScrollView!
    var horizontalScrollView: UIScrollView!
    let viewPadding: CGFloat = 10
    var xOffset: CGFloat = 0
    var startY: CGFloat = 30
    let cats: MyCollection = MyCollection(title: "Котики", images: [
        UIImage(named: "pic33")!,
        UIImage(named: "pic333")!,
        UIImage(named: "pic1111")!,
        UIImage(named: "126")!,
        UIImage(named: "pic22")!,
        UIImage(named: "pic7778")!], color: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verticalScrollView = UIScrollView(frame: CGRect(x: 0, y: startY, width: view.bounds.width, height: view.frame.height))
        view.addSubview(verticalScrollView)
        addHorizontalScrollWithViews(collection: cats)
        addHorizontalScrollWithViews(collection: cats)
        addHorizontalScrollWithViews(collection: cats)
        addHorizontalScrollWithViews(collection: cats)
        addHorizontalScrollWithViews(collection: cats)
        
    }
    func addHorizontalScrollWithViews(collection: MyCollection) {
        let collectionTitleLabel = UILabel(frame: CGRect(x: 10, y: startY, width: 200, height: 21))
        collectionTitleLabel.text = collection.title
        collectionTitleLabel.font = collectionTitleLabel.font.withSize(24)
        collectionTitleLabel.textAlignment = .left
        verticalScrollView.addSubview(collectionTitleLabel)
        startY += collectionTitleLabel.frame.height + 10
        
        let hrView = UIView()
        hrView.backgroundColor = UIColor.lightGray
        hrView.frame = CGRect(x: 10, y: startY, width: view.bounds.width - 50, height: 1)
        verticalScrollView.addSubview(hrView)
        startY += 10
        
        horizontalScrollView = UIScrollView(frame: CGRect(x: 0, y: startY, width: view.bounds.width, height: 200))
        startY += horizontalScrollView.frame.height + viewPadding * 4
        verticalScrollView.addSubview(horizontalScrollView)
        
        horizontalScrollView.backgroundColor = UIColor.clear
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        for image in collection.images {
            let myView = UIImageView()
            myView.layer.cornerRadius = 10
            myView.frame = CGRect(x: xOffset+10, y: CGFloat(viewPadding), width: 150, height: horizontalScrollView.frame.height-10)
            myView.image = image
            
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
