//
//  ContainerViewController.swift
//  DZ8-additional-2
//
//  Created by Kristina Kudinova on 11.11.2020.
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
           
        view.backgroundColor = .white
           view.addSubview(holderStackView)
       }
    
       override func viewWillLayoutSubviews() {
           super.viewWillLayoutSubviews()
           
           configureHolderStackView()
           configureViewsStackView()
       }
       
       func addVC(_ vc: UIViewController, buttonTitle: String? = nil) {
           // Сохраняем контроллер, создаем кнопку, показываем кнопку.
           
           assert(childs.count < 6, "Too many child ViewControllers: only 6 allowed")
           
           childs.append(vc)
           addChildVC(childVC: vc)
           holderStackView.addArrangedSubview(childVCStackView)
           
           guard let buttonTitle = buttonTitle else { return }
           let button = createAButton(buttonTitle: buttonTitle)
           addButtonToStackView(button)
           
           holderStackView.insertArrangedSubview(buttonsStackView, at: 0)
           configureButtonsStackView()
       }
       
       func addButtonToStackView(_ button: UIButton) {
           buttonsStackView.addArrangedSubview(button)
       }
       
       func createAButton(buttonTitle: String) -> UIButton {
           let button = UIButton()
           button.setTitle(buttonTitle, for: .normal)
           button.backgroundColor = .orange
           //button.titleLabel?.font = UIFont(name: Fonts.medium, size: 14)
           button.layer.cornerRadius = 10
           let selector = #selector(ContainerViewController.showHideContentVC2)
           button.addTarget(self, action: selector, for: UIControl.Event.touchUpInside)
           button.isUserInteractionEnabled = true
           button.isEnabled = true
           
           return button
       }
       
       func setDefaultPlaceholder(_ vc: UIViewController) {
           // Сохраняем контроллер, который показывается в случае, если ни один контент контроллер не показан
           defaultVC = vc
       }
       
       @IBAction func showHideContentVC2(sender: UIButton) {
           // Показываем или скрываем контент контроллер, который соответствует кнопке
           // Если все контент контроллеры скрыты, то показываем placeholder
           
           let index = buttonsStackView.arrangedSubviews.firstIndex(of: sender)!
           
           if sender.title(for: .normal) == "Включить" {
            addChildVC(childVC: childs[index], index: index)
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
       
    private func addChildVC(childVC: UIViewController, index: Int = 0) {
           // Функция для добавления контроллера в иерархию и его показа
           
           addChild(childVC)
        childVCStackView.insertArrangedSubview(childVC.view, at: index)
           //childVCStackView.addArrangedSubview(childVC.view)
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
           buttonsStackView.distribution = .fillEqually
           buttonsStackView.alignment = .fill
           buttonsStackView.spacing = 20
           buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
           buttonsStackView.isLayoutMarginsRelativeArrangement = true
           buttonsStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
          
       }
       
       func configureViewsStackView() {
           
           if childVCStackView.subviews.count == 0 {
               guard let vc = defaultVC else {return}
               addChildVC(childVC: vc)
           }
           
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
           
           let topConstraint = holderStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20)
           let bottomConstraint = holderStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 20)
           let leadingConstraint = holderStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
           let trailingConstraint = holderStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
           
           NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
       }
    
}
