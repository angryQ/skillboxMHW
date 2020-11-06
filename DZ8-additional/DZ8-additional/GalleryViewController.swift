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
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var progressView: UIProgressView!
    
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)
    let visualEffectView = UIVisualEffectView(effect: nil)
    var currentPicIndex = 0
    let duration: Double = 1.0
    
    var images = [UIImage(named: "pic-1")!, UIImage(named: "pic-2")!, UIImage(named: "pic-3")!, UIImage(named: "pic-4")!, UIImage(named: "pic-5")!, UIImage(named: "pic-6")!, UIImage(named: "pic-7")!, UIImage(named: "pic-8")!, UIImage(named: "pic-9")!, UIImage(named: "pic-10")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        galleryImageView.image = images[0]
        galleryImageView.contentMode = .scaleAspectFill
        galleryImageView.clipsToBounds = true
        startButton.setTitle("Стоп", for: .selected)
        slider.value = 0
        
        configureStepper()
        configureSlider()
        progressView.setProgress(0, animated: false)
        
        animator.addAnimations {
            self.visualEffectView.effect = UIBlurEffect(style: .extraLight)
        }
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupVisualBlurEffectView()
        stepper.value = Double(currentPicIndex)
    }
    
    @objc func stepperValueChanged(_ sender: UIStepper!) {
        self.galleryImageView.image = images[Int(sender.value)]
        currentPicIndex = Int(sender.value)
        updateProgressView()
    }
    
    @IBAction func startButtonTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        Timer.scheduledTimer(withTimeInterval: duration, repeats: true) { timer in
            if sender.isSelected == true {
                self.startAnimationFromImageWithIndex(self.currentPicIndex)
                self.updateProgressView()
                
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
    func updateProgressView() {
        //if self.progressView.progress != 1 {
            self.progressView.progress =  0.1 * Float(currentPicIndex + 1)
        //} else {
            //self.progressView.progress = 0.1
        //}
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
        visualEffectView.frame = galleryImageView.frame
    }
    
    func configureStepper() {
        stepper.isHidden = false
        let rightImage = UIImage(systemName: "play")
        let leftImage = UIImage(cgImage: (rightImage?.cgImage)!, scale: CGFloat(1.8), orientation: .upMirrored)
        stepper.setIncrementImage(rightImage, for: .normal)
        stepper.setDecrementImage(leftImage, for: .normal)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.autorepeat = true
        stepper.tintColor = UIColor.orange
        stepper.stepValue = 1.0
        stepper.minimumValue = 0
        stepper.maximumValue = Double(images.count - 1)
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    }
}
