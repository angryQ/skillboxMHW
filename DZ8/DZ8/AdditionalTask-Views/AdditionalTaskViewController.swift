//
//  AdditionalTaskViewController.swift
//  DZ8
//
//  Created by Kristina Kudinova on 25.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class AdditionalTaskViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    //Переменные для хранения состояния кнопки (вкл/выкл)
    var firstButtonIsEnabled = false
    var secondButtonIsEnabled = false
    var thirdButtonIsEnabled = false
    
    //Экземпляры viewController'ов которые будем отображать при нажатии на кнопки
    let greenViewController: GreenViewController = {
        let storyboard = UIStoryboard(name: "Green", bundle: nil)
        return storyboard.instantiateInitialViewController() as! GreenViewController
    }()
    let blueViewController: BlueViewController = {
        let storyboard = UIStoryboard(name: "Blue", bundle: nil)
        return storyboard.instantiateInitialViewController() as! BlueViewController
    }()
    let imageCollectionViewController: ImageCollectionViewController = {
        let storyboard = UIStoryboard(name: "ImageCollection", bundle: nil)
        return storyboard.instantiateInitialViewController() as! ImageCollectionViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.backgroundColor
    }
    
    @IBAction func firstButtonTapped() {
        
        if thirdButtonIsEnabled == true {
            remove(childController: imageCollectionViewController)
        }
        if firstButtonIsEnabled == false {
            firstButtonIsEnabled = true
            displayViewController(viewController: greenViewController, sender: firstButton)
        }
        else {
            firstButtonIsEnabled = false
            hideViewController(viewController: greenViewController, sender: firstButton)
        }
    }
    
    @IBAction func secondButtonTapped() {
        
        if thirdButtonIsEnabled == true {
            remove(childController: imageCollectionViewController)
        }
        if secondButtonIsEnabled == false {
            secondButtonIsEnabled = true
            displayViewController(viewController: blueViewController, sender: secondButton)
        }
        else {
            secondButtonIsEnabled = false
            hideViewController(viewController: blueViewController, sender: secondButton)
        }
    }
    
    @IBAction func thirdButtonTapped() {
        if firstButtonIsEnabled == false && secondButtonIsEnabled == false {
            thirdButtonIsEnabled = true
            add(childController: imageCollectionViewController)
            updateViews(containerView: containerView)
        }
    }
    
    //Метод который вызывается при включении viewController'а
    private func displayViewController(viewController: UIViewController, sender: UIButton) {
        
        add(childController: viewController)
        sender.setTitle("Выключить", for: .normal)
        updateViews(containerView: containerView)
    }
    
    //Метод который вызывается при выключении viewController'а
    private func hideViewController(viewController: UIViewController, sender: UIButton){
        
        remove(childController: viewController)
        sender.setTitle("Включить", for: .normal)
        updateViews(containerView: containerView)
    }
    
    //Метод для добавления viewController'а в контейнер
    private func add(childController: UIViewController) {
        
        addChild(childController)
        childController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        containerView.addSubview(childController.view)
        childController.didMove(toParent: self)
    }
    
    //Метод для удаления viewController'а из контейнера
    private func remove(childController: UIViewController) {
        
        childController.willMove(toParent: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParent()
    }
    
    //Метод, который рассчитывает высоту viewController'ов и обновляет их размеры
    private func updateViews(containerView: UIView) {
        
        let subviewsCount = containerView.subviews.count
        let availableWidth = containerView.bounds.width
        var yPos: CGFloat = 20
        let uiHeight: CGFloat = containerView.bounds.height / CGFloat(subviewsCount)
        
        for view in containerView.subviews {
            view.frame = CGRect(x: 0, y: yPos, width: availableWidth, height: uiHeight)
            yPos = uiHeight + 2
        }
    }
}
