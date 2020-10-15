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
    
    //Благодаря структуре стало проще добавлять, редактировать и удалять страницы для PageViewController, менять их порядок
    struct OnboardingPage {
        
        let content: String
        let imageName: String
        
        init(content: String, imageName: String){
            self.content = content
            self.imageName = imageName
        }
    }
    
    var pageArray: [OnboardingPage] = []
    
    let pageOne = OnboardingPage(content: "На первой табе находится первое д/з с галереей", imageName: "pic-2")
    let pageTwo = OnboardingPage(content: "На второй табе находится д/з с отображением четырех изображений на одном экране",
                                 imageName: "pic-5")
    let pageThree = OnboardingPage(content: "На третьей табе д/з с использованием UISegmentedControl", imageName: "pic-9")
    let pageFour = OnboardingPage(content: "На четвертой табе реализация Container View Controller (дополнительное д/з за 7 модуль)",
                                  imageName: "pic-6")
    let pageFive = OnboardingPage(content: "А вся эта презентация демонстрирует применение UIPageViewController (дополнительное д/з за 7 модуль)", imageName: "autumn")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        pageArray = [pageOne, pageTwo, pageThree, pageFour, pageFive]
        
        if let contentViewController = createViewControllerAtIndex(0) {
            
            //метод который создает массив из view controller'ов
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //Метод который позволяет нам создать view controller
    func createViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 && index < pageArray.count else { return nil }
        
        guard let contentViewController = storyboard?.instantiateViewController(
            withIdentifier: "ContentViewController") as? ContentViewController  else { return nil }
        
        contentViewController.presentText = pageArray[index].content
        contentViewController.imageName = pageArray[index].imageName
        
        contentViewController.numberOfPages = pageArray.count
        contentViewController.currentPage = index
        
        return contentViewController
    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return createViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        
        return createViewControllerAtIndex(pageNumber)
    }
}
