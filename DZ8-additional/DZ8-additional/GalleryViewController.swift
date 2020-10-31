//
//  GalleryViewController.swift
//  DZ8-additional
//
//  Created by Kristina Kudinova on 30.10.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var galleryImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var currentPicIndex = 0
    let duration: Double = 0.8
    var images = [UIImage(named: "pic-1")!, UIImage(named: "pic-2")!, UIImage(named: "pic-3")!, UIImage(named: "pic-4")!, UIImage(named: "pic-5")!, UIImage(named: "pic-6")!, UIImage(named: "pic-7")!, UIImage(named: "pic-8")!, UIImage(named: "pic-9")!, UIImage(named: "pic-10")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        galleryImageView.image = images[0]
        galleryImageView.contentMode = .scaleAspectFit
        startButton.setTitle("Стоп", for: .selected)
    }
    
    @IBAction func backButtonTap() {
        currentPicIndex -= 1
        if currentPicIndex < 0 {
            currentPicIndex = images.count - 1
        }
        self.galleryImageView.image = images[currentPicIndex]
    }
    
    @IBAction func nextButtonTap() {
        currentPicIndex += 1
        if currentPicIndex > images.count - 1 {
            currentPicIndex = 0
        }
        self.galleryImageView.image = images[currentPicIndex]
    }
    
    @IBAction func startButtonTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        Timer.scheduledTimer(withTimeInterval: duration, repeats: true) { timer in
            if sender.isSelected == true {
                self.startAnimationFromImageWithIndex(self.currentPicIndex)
                self.currentPicIndex += 1
                
                if self.currentPicIndex > self.images.count - 1 {
                    self.currentPicIndex = 0
                }
            }
            else {
                self.stopAnimationOnImageWithIndex(self.currentPicIndex)
                timer.invalidate()
            }
        }
    }
    
    func stopAnimationOnImageWithIndex(_ index: Int) {
        galleryImageView.stopAnimating()
        galleryImageView.image = images[index]
    }
    
    @objc func startAnimationFromImageWithIndex(_ index: Int) {
        let subArray = Array(self.images[index..<self.images.count])
        self.galleryImageView.animationImages = subArray
        self.galleryImageView.animationDuration = Double(subArray.count) * duration
        self.galleryImageView.startAnimating()
        
    }
}
