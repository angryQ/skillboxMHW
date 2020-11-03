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
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)
    let visualEffectView = UIVisualEffectView(effect: nil)
    let stepper = UIStepper()
    var currentPicIndex = 0
    let duration: Double = 0.8
    
    var images = [UIImage(named: "pic-1")!, UIImage(named: "pic-2")!, UIImage(named: "pic-3")!, UIImage(named: "pic-4")!, UIImage(named: "pic-5")!, UIImage(named: "pic-6")!, UIImage(named: "pic-7")!, UIImage(named: "pic-8")!, UIImage(named: "pic-9")!, UIImage(named: "pic-10")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        galleryImageView.image = images[0]
        galleryImageView.contentMode = .scaleAspectFit
        galleryImageView.clipsToBounds = true
        startButton.setTitle("Стоп", for: .selected)
        slider.value = 0
        
        configureStepper()
        configureSlider()
        
        
        animator.addAnimations {
            //self.galleryImageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.visualEffectView.effect = UIBlurEffect(style: .extraLight)
        }
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupVisualBlurEffectView()
    }
    
    @objc func stepperValueChanged(_ sender:UIStepper!)
    {
        self.galleryImageView.image = images[Int(sender.value)]
        currentPicIndex = Int(sender.value)
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
        if index == 0 {
            galleryImageView.image = images[images.count - 1]
        } else {
            galleryImageView.image = images[index - 1]
        }
    }
    
    @objc func startAnimationFromImageWithIndex(_ index: Int) {
        let subArray = Array(self.images[index..<self.images.count])
        self.galleryImageView.animationImages = subArray
        self.galleryImageView.animationDuration = Double(subArray.count) * duration
        self.galleryImageView.startAnimating()
    }
    
    func configureSlider() {
        slider.minimumValue = 0
        slider.maximumValue = 0.3
        slider.minimumTrackTintColor = .orange
        slider.maximumTrackTintColor = .gray
        slider.thumbTintColor = .black
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
    }
    
    @objc func handleSliderChange(sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }
    
    func setupVisualBlurEffectView() {
        view.addSubview(visualEffectView)
        //guard let height = galleryImageView.image?.size.height, let width = galleryImageView.image?.size.width else {return}
        visualEffectView.frame = CGRect(x: 20, y: 20, width: galleryImageView.frame.width, height: galleryImageView.frame.height)
    }
    
    func configureStepper() {
        stepper.setIncrementImage(UIImage(systemName: "bell"), for: .normal)
        stepper.setDecrementImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.autorepeat = true
        stepper.tintColor = UIColor.orange
        stepper.stepValue = 1.0
        stepper.minimumValue = 0
        stepper.maximumValue = Double(images.count - 1)
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        self.view.addSubview(stepper)
        
        //let topConstraint = stepper.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20)
        let bottomConstraint = stepper.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        let leadingConstraint = stepper.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 50)
        let trailingConstraint = stepper.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, bottomConstraint])
    }
}
