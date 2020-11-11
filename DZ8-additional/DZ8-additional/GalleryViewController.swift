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
    
    var images = [UIImage(named: "pic-1")!, UIImage(named: "pic-2")!, UIImage(named: "pic-3")!, UIImage(named: "pic-4")!, UIImage(named: "pic-5")!, UIImage(named: "pic-6")!, UIImage(named: "pic-7")!, UIImage(named: "pic-8")!, UIImage(named: "pic-9")!, UIImage(named: "pic-10")!]
    var currentPicIndex = 0
    let duration: Double = 1.0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryImageView.image = images[0]
        galleryImageView.contentMode = .scaleAspectFill
        startButton.setTitle("Стоп", for: .selected)
        slider.value = 0
        view.addSubview(visualEffectView)
        
        configureStepper()
        configureSlider()
        progressView.setProgress(0, animated: false)
        
        animator.addAnimations {
            self.visualEffectView.effect = UIBlurEffect(style: .extraLight)
        }
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        visualEffectView.frame = galleryImageView.frame
        stepper.value = Double(currentPicIndex)
    }
    
    //Обрабатываем нажатие на кнопку Start/Stop
    @IBAction func startButtonTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if timer == nil, sender.isSelected == true {
            timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: true) { timer in
                self.currentPicIndex += 1
                if self.currentPicIndex > self.images.count - 1 {
                    self.currentPicIndex = 0
                }
                self.startAnimationFromImageWithIndex(self.currentPicIndex)
                self.updateProgressView()
            }
        }
        else {
            self.stopAnimationOnImageWithIndex(self.currentPicIndex)
            timer?.invalidate()
            timer = nil
        }
    }
    //Обновляем состояние прогресс вью
    private func updateProgressView() {
        self.progressView.progress =  0.1 * Float(currentPicIndex + 1)
    }
    
    //События выполняемые во время запущенной анимации
    private func startAnimationFromImageWithIndex(_ index: Int) {
        let subArray = Array(self.images[index..<self.images.count])
        self.galleryImageView.animationImages = subArray
        self.galleryImageView.animationDuration = Double(subArray.count) * duration
        self.galleryImageView.startAnimating()
    }
    
    //События выполняемые во время паузы анимации
    private func stopAnimationOnImageWithIndex(_ index: Int) {
        galleryImageView.stopAnimating()
        if index == images.count || index <= 0 {
            galleryImageView.image = self.images[0]
        }
        else {
            self.galleryImageView.image = self.images[index]
        }
    }
    //Настройка слайдера с эффектом размытия картинок
    private func configureSlider() {
        slider.minimumValue = 0
        slider.maximumValue = 0.3
        slider.minimumTrackTintColor = .orange
        slider.maximumTrackTintColor = .gray
        slider.thumbTintColor = .black
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
    }
    
    //Настройка степпера
    private func configureStepper() {
        let rightImage = UIImage(systemName: "play")
        let leftImage = UIImage(cgImage: (rightImage?.cgImage)!, scale: CGFloat(1.8), orientation: .upMirrored)
        stepper.setIncrementImage(rightImage, for: .normal)
        stepper.setDecrementImage(leftImage, for: .normal)
        stepper.tintColor = UIColor.orange
        stepper.stepValue = 1.0
        stepper.minimumValue = 0
        stepper.maximumValue = Double(images.count - 1)
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    }
    
    //Действия, выполняемые при нажатии на кнопки степпера
    @objc func stepperValueChanged(_ sender: UIStepper!) {
        self.galleryImageView.image = images[Int(sender.value)]
        currentPicIndex = Int(sender.value)
        updateProgressView()
    }
    
    //Метод обработки состояния слайдера
    @objc func handleSliderChange(sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }
}
