//
//  ContainerViewController.swift
//  Container
//
//  Created by Kristina Kudinova on 15.10.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
   lazy var buttonsStackView = UIStackView()
    var childVCStackView = UIStackView()
    var holderStackView = UIStackView()
    
    var buttonIsSelected = false
    private var childs: [UIViewController] = []
    private var defaultVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(holderStackView)
        holderStackView.addArrangedSubview(childVCStackView)
        configureHolderStackView()
        configureViewsStackView()
        //self.view.addSubview(buttonsStackView)
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    
    }
    
    func addVC(_ vc: UIViewController, buttonTitle: String? = nil) {
        // Сохраняем контроллер, создаем кнопку, показываем кнопку.
        
        assert(childs.count < 6, "Too many child ViewControllers: only 6 allowed")
        
        childs.append(vc)
        addChildVC(childVC: vc)
        
        
        guard let buttonTitle = buttonTitle else { return }
        let button = createAButton(buttonTitle: buttonTitle)
        addButtonToStackView(button)
        
        holderStackView.insertArrangedSubview(buttonsStackView, at: 0)
        configureButtonsStackView()
        self.view.layoutIfNeeded()
    }
    
    func addButtonToStackView(_ button: UIButton) {
        buttonsStackView.addArrangedSubview(button)
    }
    
    func createAButton(buttonTitle: String) -> UIButton {
        let button = UIButton()
        button.setTitle(buttonTitle, for: .normal)
        button.isUserInteractionEnabled = true
        button.isEnabled = true
        button.backgroundColor = .blue
        let selector = #selector(ContainerViewController.showHideContentVC)
        button.addTarget(self, action: selector, for: UIControl.Event.touchUpInside)
        
        return button
    }
    
    func setDefaultPlaceholder(_ vc: UIViewController) {
        // Сохраняем контроллер, который показывается в случае, если ни один контент контроллер не показан
        defaultVC = vc
    }
    
    @IBAction func showHideContentVC(sender: UIButton) {
        // Показываем или скрываем контент контроллер, который соответствует кнопке
        // Если все контент контроллеры скрыты, то показываем placeholder
        
        let index = buttonsStackView.arrangedSubviews.firstIndex(of: sender)!
        
        if sender.title(for: .normal) == "Включить" {
            addChildVC(childVC: childs[index])
            sender.setTitle("Выключить", for: .normal)
            if (defaultVC?.view.isDescendant(of: childVCStackView))! {
                removeChildVC(childVC: defaultVC!)
            }
        }
        else {
            removeChildVC(childVC: childs[index])
            sender.setTitle("Включить", for: .normal)
        }
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
    
    func configureButtonsStackView() {
        
        buttonsStackView.axis = .horizontal
        buttonsStackView.layer.backgroundColor = UIColor.cyan.cgColor
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 20
        buttonsStackView.isHidden = false
        
        let topConstraint = buttonsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        //       let bottomConstraint = buttonsStackView.bottomAnchor.constraint(equalTo: childVCStackView.topAnchor, constant: 20).isActive = true
        let leadingConstraint = buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        let trailingConstraint = buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint])
    }
    func configureViewsStackView() {
        var topConstraint = childVCStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        if childVCStackView.subviews.count == 0 {
            guard let vc = defaultVC else {return}
            addChildVC(childVC: vc)
        }
        
        childVCStackView.axis = .vertical
        childVCStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childVCStackView.distribution = .fillEqually
        childVCStackView.alignment = .fill
        childVCStackView.layer.backgroundColor = UIColor.red.cgColor
        
        childVCStackView.translatesAutoresizingMaskIntoConstraints = false
        
        if holderStackView.subviews.contains(buttonsStackView)
        {
            topConstraint = childVCStackView.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 100)
        }
        
        let bottomConstraint = childVCStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20)
        let leadingConstraint = childVCStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
        let trailingConstraint = childVCStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, trailingConstraint, leadingConstraint])
        
    }
    func configureHolderStackView() {
        holderStackView.axis = .vertical
        holderStackView.distribution = .fill
        holderStackView.alignment = .fill
        holderStackView.spacing = 20
        holderStackView.layer.backgroundColor = UIColor.yellow.cgColor
        
        let topConstraint = holderStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        let bottomConstraint = holderStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        let leadingConstraint = holderStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
        let trailingConstraint = holderStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint])
    }
}
