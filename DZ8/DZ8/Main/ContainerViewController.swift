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
    
    private var childs: [UIViewController] = []
    private var defaultVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.backgroundColor
        view.addSubview(holderStackView)
        holderStackView.addArrangedSubview(childVCStackView)
        holderStackView.insertArrangedSubview(buttonsStackView, at: 0)
        configureHolderStackView()
        configureViewsStackView()
        configureButtonsStackView()
    }
    
    func addVC(_ vc: UIViewController) {
        // Сохраняем контроллер, создаем кнопку, показываем кнопку.
        
        assert(childs.count < 6, "Too many child ViewControllers: only 6 allowed")
        
        childs.append(vc)
        addChildVC(childVC: vc)
        
        let button = createAButton()
        buttonsStackView.addArrangedSubview(button)
    }
    
    func createAButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Включить", for: .normal)
        button.setTitle("Выключить", for: .selected)
        button.backgroundColor = Colors.orange
        button.titleLabel?.font = UIFont(name: Fonts.medium, size: 14)
        button.layer.cornerRadius = 10
        button.isUserInteractionEnabled = true
        button.isEnabled = true
        button.isSelected = true
        let selector = #selector(ContainerViewController.showHideContentVC2)
        button.addTarget(self, action: selector, for: UIControl.Event.touchUpInside)
        
        return button
    }
    
    func setDefaultPlaceholder(_ vc: UIViewController) {
        // Сохраняем контроллер, который показывается в случае, если ни один контент контроллер не показан
        defaultVC = vc
    }
    
    @IBAction func showHideContentVC2(sender: UIButton) {
        // Показываем или скрываем контент контроллер, который соответствует кнопке
        // Если все контент контроллеры скрыты, то показываем placeholder
        
        sender.isSelected = !sender.isSelected
        let index = buttonsStackView.arrangedSubviews.firstIndex(of: sender)!
        
        if sender.isSelected {
            addChildVC(childVC: childs[index])
            if (defaultVC?.view.isDescendant(of: childVCStackView))! {
                removeChildVC(childVC: defaultVC!)
            }
        } else {
            removeChildVC(childVC: childs[index])
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
        
        //Если все VC внутри childStackview скрыты, то отображаем дефолтный вью котроллер
        if childVCStackView.subviews.count == 0 {
            guard let vc = defaultVC else {return}
            addChildVC(childVC: vc)
        }
    }
    
    func configureButtonsStackView() {
        
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.alignment = .fill
        buttonsStackView.spacing = 20
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.isLayoutMarginsRelativeArrangement = true
        buttonsStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func configureViewsStackView() {
        
        childVCStackView.axis = .vertical
        childVCStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childVCStackView.distribution = .fillEqually
        childVCStackView.alignment = .fill
        childVCStackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configureHolderStackView() {
        
        holderStackView.axis = .vertical
        holderStackView.distribution = .fill
        holderStackView.alignment = .fill
        holderStackView.spacing = 20
        holderStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            holderStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            holderStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            holderStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            holderStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
}
