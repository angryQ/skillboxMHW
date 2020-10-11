//
//  PageViewController.swift
//  DZ8
//
//  Created by Kristina Kudinova on 30.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

//Класс, который управляет другими вью контроллерами, которые будут отображать контент моей презентации
class PageViewController: UIPageViewController {
    
    let presentScreenContent = ["На первой табе находится первое д/з с галереей",
                                "На второй табе находится д/з с отображением четырех изображений на одном экране",
                                "На третьей табе д/з с использованием UISegmentedControl",
                                "На четвертой табе реализация Container View Controller (дополнительное д/з за 7 модуль)",
                                "А вся эта презентация демонстрирует применение UIPageViewController (дополнительное д/з за 7 модуль)"
        
    ]
    let imageNameArray = ["pic-2","pic-5","pic-9","pic-6","autumn"]
    let buttonIsHidden = [true, true, true, true, false]
    let pageControlIsHidden = [false, false, false, false, true]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let contentViewController = showViewControllerAtIndex(0) {
            
            //метод который создает массив из view controller'ов
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //Метод который позволяет нам создать view controller
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else { return nil }
        
        guard index < presentScreenContent.count else { return nil }
        
        guard let contentViewController = storyboard?.instantiateViewController(
            withIdentifier: "ContentViewController") as? ContentViewController  else { return nil }
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.imageName = imageNameArray[index]
        
        contentViewController.numberOfPages = presentScreenContent.count
        contentViewController.currentPage = index
        contentViewController.pageControlIsHidden = pageControlIsHidden[index]
        contentViewController.startButtonIsHidden = buttonIsHidden[index]
        
        return contentViewController
    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
}
