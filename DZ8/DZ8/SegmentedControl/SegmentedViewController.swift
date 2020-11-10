//
//  SegmentedViewController.swift
//  DZ8
//
//  Created by Kristina Kudinova on 17.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class SegmentedViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //Экземпляры viewController'ов которые будут отображаться при нажатии переключении UISegmentedControl'а
    let greenViewController: GreenViewController = {
        let storyboard = UIStoryboard(name: "Green", bundle: nil)
        return storyboard.instantiateInitialViewController() as! GreenViewController
    }()
    let blueViewController: BlueViewController = {
        let storyboard = UIStoryboard(name: "Blue", bundle: nil)
        return storyboard.instantiateInitialViewController() as! BlueViewController
    }()
    let purpleViewController: PurpleViewController = {
        let storyboard = UIStoryboard(name: "Purple", bundle: nil)
        return storyboard.instantiateInitialViewController() as! PurpleViewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.backgroundColor
        segmentedControlIndexChanged(segment: segmentedControl)
    }
    
    @IBAction func segmentedControlIndexChanged(segment: UISegmentedControl) {
        
        for (index, vc) in [greenViewController, blueViewController, purpleViewController].enumerated() {
            if index == segmentedControl.selectedSegmentIndex {
                add(childController: vc)
            } else {
                remove(childController: vc)
            }
        }
    }
    
    //Метод для добавления viewController'а в контейнер
    private func add(childController: UIViewController) {
        
        addChild(childController)
        self.view.addSubview(childController.view)
        addConstraintsToSubview(subview: childController.view)
        childController.didMove(toParent: self)
    }
    
    //Метод для удаления viewController'а из контейнера
    private func remove(childController: UIViewController) {
        
        childController.willMove(toParent: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParent()
    }
    
    //Метод который добавляет отступы дочерним вью, иначе дочернее вью частично отображается под сегментед контроллом
    private func addConstraintsToSubview(subview: UIView) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            subview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            subview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

