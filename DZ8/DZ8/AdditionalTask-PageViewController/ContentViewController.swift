//
//  OnboardingViewController.swift
//  DZ8
//
//  Created by Kristina Kudinova on 04.10.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

//Класс-шаблон, в который PageViewController будет подставлять для каждой отдельной страницы уникальные данные

class ContentViewController: UIViewController {
    
    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    var presentText = ""
    var imageName = ""
    var currentPage = 0
    var numberOfPages = 0
    var startButtonIsHidden = true
    var pageControlIsHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.backgroundColor
        startButton.isHidden = true
        presentTextLabel.text = presentText
        
        imageView.layer.cornerRadius = (self.view.frame.width - 120) / 2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: imageName)
        
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        if currentPage == numberOfPages - 1 {
            pageControl.isHidden = true
            startButton.isHidden = false
        }
    }
    
    @IBAction func startWatchHomeWork() {
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController()
    }
}
