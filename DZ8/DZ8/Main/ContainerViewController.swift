//
//  ContainerViewController.swift
//  DZ8
//
//  Created by Kristina Kudinova on 15.10.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var buttonsStackView = UIStackView()
    var childVCStackView = UIStackView()
    
    private var childs: [UIViewController] = []
    private var defaultVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStackView()
        configureViewStackView()
        view.addSubview(buttonsStackView)
    }
    func addVC(_ vc: UIViewController, buttonTitle: String) {
        assert(childs.count < 6, "Too many child ViewControllers: only 6 allowed")
        // Сохраняем контроллер, создаем кнопку, показываем кнопку.
        
        addChildVC(childVC: vc)
        let button = UIButton()
        button.setTitle(buttonTitle, for: .normal)
        
        addButtonToStackView(button)
        showHideContentVC(button)
    }
    func configureStackView() {
        buttonsStackView.axis = .horizontal
               buttonsStackView.backgroundColor = .red
               buttonsStackView.distribution = .fillEqually
               buttonsStackView.spacing = 20
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = buttonsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        let bottomConstraint = buttonsStackView.bottomAnchor.constraint(equalTo: childVCStackView.topAnchor, constant: 20)
        let leadingConstraint = buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
        let trailingConstraint = buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    }
    func configureViewStackView() {
        childVCStackView.axis = .vertical
               childVCStackView.backgroundColor = .green
               childVCStackView.distribution = .fill
               childVCStackView.spacing = 20
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = buttonsStackView.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 20)
        let bottomConstraint = buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20)
        let leadingConstraint = buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
        let trailingConstraint = buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    }
    func addButtonToStackView(_ button: UIButton) {
        buttonsStackView.addArrangedSubview(button)
    }
    
    func setPlaceholder(_ vc: UIViewController) {
        // Сохраняем контроллер, который показывается в случае, если ни один контент контроллер не показан
        addChildVC(childVC: vc)
    }
    
    @objc func showHideContentVC(_ sender: UIButton) {
        // Показываем или скрываем контент контроллер, который соответствует кнопке
        // Если все контент контроллеры скрыты, то показываем placeholder
        
        
    }
    
    private func addChildVC(childVC: UIViewController) {
        // Функция для добавления контроллера в иерархию и его показа
        addChild(childVC)
        childVCStackView.addArrangedSubview(childVC.view)
        childVC.didMove(toParent: self)
    }
    
    private func removeChildVC(childVC: UIViewController) {
        // Функция для удаления контроллера из иерархии и его скрытия
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
    }
    
    //Метод который добавляет отступы дочерним вью, иначе дочернее вью частично отображается под сегментед контроллом
    private func addConstraintsToSubview(subview: UIView) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = subview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        let bottomConstraint = subview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        let leadingConstraint = subview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
        let trailingConstraint = subview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    }
}
