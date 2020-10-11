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
    
    var window: UIWindow?
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
        
        if let unwrappedImageView = imageView {
            unwrappedImageView.layer.cornerRadius = (self.view.frame.width - 120) / 2
            unwrappedImageView.layer.masksToBounds = true
            unwrappedImageView.contentMode = .scaleAspectFill
            unwrappedImageView.image = UIImage(named: imageName)
        }
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        pageControl.isHidden = pageControlIsHidden
        startButton.isHidden = startButtonIsHidden
    }
    
    @IBAction func startWatchHomeWork() {
        
        let mainStoryboard = UIStoryboard (name: "Main", bundle: nil)
        
        if let mainViewController = mainStoryboard.instantiateViewController(
            withIdentifier: "TabBar") as? UITabBarController {
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = mainViewController
            window?.makeKeyAndVisible()
            
            /*Как правильно выходить из PаgeViewController'а? При использовании кода ниже,
             PageViewController продолжает отображаться на экране, просто скрыт раснятуным на весь экран
             модальным окном, и это не очень хорошо. При попытке удалить его из памяти, также и удаляется
             модальное окно с TabBarController'ом (mainViewController). В итоге я создала еще один UIWindow,
             и как я поняла UIApplication может содержать несколько UIWindow, а тогда как система поняла что нужно
             отобразить новое окно и что стало с предыдущим?
             
             mainViewController.modalPresentationStyle = .fullScreen
             present(mainViewController, animated: true, completion: nil)
             */
        }
    }
}
