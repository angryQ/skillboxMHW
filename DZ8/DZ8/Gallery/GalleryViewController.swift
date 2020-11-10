//
//  GallleryViewController.swift
//  DZ8
//
//  Created by Kristina Kudinova on 16.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var galleryImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var currentPicIndex = 0
    var imageNameArray = ["pic-1", "pic-2", "pic-3", "pic-4", "pic-5", "pic-6", "pic-7", "pic-8", "pic-9", "pic-10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.backgroundColor
        
        galleryImageView.contentMode = .scaleAspectFit
        galleryImageView.image = UIImage(named: imageNameArray[0])
    }
    
    @IBAction func backButtonTap() {
        currentPicIndex -= 1
        if currentPicIndex < 0 {
            currentPicIndex = imageNameArray.count - 1
        }
        animateImage(imageName: imageNameArray[currentPicIndex])
    }
    
    @IBAction func nextButtonTap() {
        currentPicIndex += 1
        if currentPicIndex > imageNameArray.count - 1 {
            currentPicIndex = 0
        }
        animateImage(imageName: imageNameArray[currentPicIndex])
    }
    
    //Пробовала анимацию изображений
    private func animateImage(imageName: String) {
        
        UIView.transition(with: galleryImageView, duration: 0.1, options: .transitionCrossDissolve, animations: {
            self.galleryImageView.image = UIImage(named: imageName) })
    }
}
