//
//  ScrollViewController.swift
//  DZ10
//
//  Created by Kristina Kudinova on 18.11.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit
import MapKit

class ScrollViewController: UIViewController {
    /*
     let scrollView = UIScrollView()
     var contentStackView = UIStackView()
     let contentView = UIView()
     let bannerView = UIView()
     
     lazy var placeName: UILabel = {
     let label = UILabel()
     label.text = "Бургерная Джо"
     label.textColor = .black
     label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
     label.textAlignment = .center
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
     }()
     lazy var placeType: UILabel = {
     let label = UILabel()
     label.text = "Американская кухня"
     label.textColor = .gray
     label.font.withSize(12)
     label.textAlignment = .center
     label.translatesAutoresizingMaskIntoConstraints = false
     label.widthAnchor.constraint(equalToConstant: label.intrinsicContentSize.width + 5).isActive = true
     return label
     }()
     lazy var placeDescription: UILabel = {
     let label = UILabel()
     label.text = "Что нужно для того, чтобы приготовить самые вкусные бургеры? Сперва, это качественные ингредиенты."
     label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
     label.font.withSize(11)
     label.textAlignment = .left
     label.numberOfLines = 0
     label.translatesAutoresizingMaskIntoConstraints = false
     label.sizeThatFits(CGSize(width: self.view.bounds.width - 40, height: CGFloat.infinity + 20))
     label.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 40).isActive = true
     label.heightAnchor.constraint(equalToConstant: label.frame.size.height + 20).isActive = true
     return label
     }()
     lazy var raiting: UILabel = {
     let label = UILabel()
     label.text = " 5.0 "
     label.textColor = .black
     label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
     label.textAlignment = .left
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
     }()
     lazy var discountLabel: UILabel = {
     let label = UILabel()
     label.text = "Ваша скидка"
     label.textColor = .black
     label.font.withSize(12)
     label.textAlignment = .left
     label.translatesAutoresizingMaskIntoConstraints = false
     label.widthAnchor.constraint(equalToConstant: label.intrinsicContentSize.width + 5).isActive = true
     return label
     }()
     lazy var discountLabel2: UILabel = {
     let label = UILabel()
     label.text = "20%"
     label.textColor = .black
     label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
     label.textAlignment = .left
     label.translatesAutoresizingMaskIntoConstraints = false
     label.widthAnchor.constraint(equalToConstant: label.intrinsicContentSize.width).isActive = true
     return label
     }()
     lazy var dividerLine: UILabel = {
     let label = UILabel()
     label.text = " | "
     label.textColor = .lightGray
     label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
     label.textAlignment = .center
     label.translatesAutoresizingMaskIntoConstraints = false
     label.widthAnchor.constraint(equalToConstant: 70).isActive = true
     return label
     }()
     lazy var menuButton: UIButton = {
     let button = UIButton()
     button.setTitle("МЕНЮ", for: UIControl.State.normal)
     button.setTitleColor(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), for: UIControl.State.normal)
     button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
     button.backgroundColor = UIColor.white
     button.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
     button.layer.borderWidth = 1
     button.layer.cornerRadius = 15
     button.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 80).isActive = true
     button.heightAnchor.constraint(equalToConstant: 50).isActive = true
     
     return button
     }()
     lazy var createEventButton: UIButton = {
     let button = UIButton()
     button.setTitle("СОЗДАТЬ СОБЫТИЕ", for: UIControl.State.normal)
     button.setTitleColor(UIColor.white, for: UIControl.State.normal)
     button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
     button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
     button.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
     button.layer.borderWidth = 1
     button.layer.cornerRadius = 15
     button.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 40).isActive = true
     button.heightAnchor.constraint(equalToConstant: 60).isActive = true
     //button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
     return button
     }()
     lazy var placeMap: MKMapView = {
     let map = MKMapView()
     map.layer.cornerRadius = 15
     map.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 40).isActive = true
     map.heightAnchor.constraint(equalToConstant: 200).isActive = true
     map.mapType = MKMapType.standard
     map.setRegion(MKCoordinateRegion(MKMapRect(x: 200, y: 200, width: 200, height: 200)), animated: true)
     return map
     }()
     lazy var placeCommentLabel: UILabel = {
     let label = UILabel()
     label.text = "Депозит составляет 100 ₽. При отмене брони, менее чем за 2 часа депозит удерживается"
     label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
     label.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 80).isActive = true
     label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
     label.numberOfLines = 0
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
     }()
     lazy var placeOutsideButton: UIButton = {
     let button = UIButton()
     button.setTitle("ЗАКАЗАТЬ НА ВЫНОС", for: UIControl.State.normal)
     button.setTitleColor(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), for: UIControl.State.normal)
     button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
     button.backgroundColor = UIColor.white
     button.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
     button.layer.borderWidth = 1
     button.layer.cornerRadius = 15
     button.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 40).isActive = true
     button.heightAnchor.constraint(equalToConstant: 50).isActive = true
     //button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
     return button
     }()
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.addSubview(scrollView)
        //configureScrollView()
    }
    /*
     override func viewWillLayoutSubviews() {
     super.viewWillLayoutSubviews()
     
     drawPage()
     }
     
     func drawPage() {
     
     let bannerView = fillBanner()
     scrollView.addSubview(bannerView)
     configureBannerView()
     
     let contentView = fillContentView()
     scrollView.addSubview(contentView)
     configureContentView()
     }
     
     func fillBanner() -> UIView {
     bannerView.backgroundColor = .orange
     
     let bannerImage = UIImageView()
     bannerImage.image = UIImage(named: "burger")
     bannerImage.contentMode = .scaleAspectFill
     bannerView.clipsToBounds = true
     bannerImage.frame = CGRect(x: 0, y: 0, width: self.view.frame.width-6, height: self.view.frame.height/3)
     bannerView.addSubview(bannerImage)
     
     let pageControl = configurePageControl()
     bannerView.addSubview(pageControl)
     pageControl.translatesAutoresizingMaskIntoConstraints = false
     pageControl.centerXAnchor.constraint(equalTo: bannerImage.centerXAnchor).isActive = true
     pageControl.bottomAnchor.constraint(equalTo: bannerImage.bottomAnchor, constant: -30).isActive = true
     bannerView.layoutIfNeeded()
     return bannerView
     }
     private func fillContentView2() {
     contentView.backgroundColor = .white
     contentView.layer.cornerRadius = 20
     contentView.addSubview(placeName)
     }
     private func fillContentView() -> UIView {
     contentView.backgroundColor = .white
     contentView.layer.cornerRadius = 20
     contentView.addSubview(contentStackView)
     
     configureContentStackView()
     contentStackView.addArrangedSubview(placeName)
     contentStackView.addArrangedSubview(placeType)
     
     let discountStackView = UIStackView()
     discountStackView.axis = .horizontal
     discountStackView.distribution = .fillProportionally
     discountStackView.alignment = .fill
     discountStackView.spacing = 0
     contentStackView.addArrangedSubview(discountStackView)
     
     discountStackView.translatesAutoresizingMaskIntoConstraints = false
     let leadingConstraint = discountStackView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 0)
     let trailingConstraint = discountStackView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: 0)
     let heightConstraint = discountStackView.heightAnchor.constraint(equalToConstant: 50)
     NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, heightConstraint])
     
     let discountImage = UIImageView()
     discountImage.image = UIImage(named: "discount")
     discountImage.contentMode = .scaleAspectFit
     discountImage.clipsToBounds = true
     discountImage.translatesAutoresizingMaskIntoConstraints = false
     discountImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
     
     discountStackView.addArrangedSubview(discountImage)
     discountStackView.addArrangedSubview(discountLabel)
     discountStackView.addArrangedSubview(discountLabel2)
     discountStackView.addArrangedSubview(dividerLine)
     
     let starImage = UIImageView()
     starImage.image = UIImage(systemName: "star")
     starImage.contentMode = .scaleAspectFit
     starImage.clipsToBounds = true
     starImage.translatesAutoresizingMaskIntoConstraints = false
     starImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
     discountStackView.addArrangedSubview(starImage)
     discountStackView.addArrangedSubview(raiting)
     
     contentStackView.addArrangedSubview(placeDescription)
     contentStackView.addArrangedSubview(menuButton)
     contentStackView.addArrangedSubview(placeMap)
     contentStackView.addArrangedSubview(placeCommentLabel)
     contentStackView.addArrangedSubview(createEventButton)
     contentStackView.addArrangedSubview(placeOutsideButton)
     contentView.layoutIfNeeded()
     
     return contentView
     }
     
     func configurePageControl() -> UIPageControl{
     let pageControl = UIPageControl()
     pageControl.numberOfPages = 5
     pageControl.currentPage = 0
     pageControl.tintColor = UIColor.red
     pageControl.pageIndicatorTintColor = UIColor.white
     pageControl.currentPageIndicatorTintColor = UIColor.green
     return pageControl
     }
     
     private func configureScrollView() {
     scrollView.translatesAutoresizingMaskIntoConstraints = false
     let topConstraint = scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
     let bottomConstraint = scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
     let leadingConstraint = scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
     let trailingConstraint = scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
     NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
     }
     private func configureContentView() {
     
     contentView.translatesAutoresizingMaskIntoConstraints = false
     let topConstraint = contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: self.view.frame.height / 3 - 20)
     let bottomConstraint = contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
     let leadingConstraint = contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0)
     let trailingConstraint = contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0)
     let widthConstraint = contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
     
     NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint,widthConstraint])
     }
     private func configureBannerView() {
     
     bannerView.translatesAutoresizingMaskIntoConstraints = false
     let topConstraint = bannerView.topAnchor.constraint(equalTo: scrollView.topAnchor)
     let bottomConstraint = bannerView.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: self.view.frame.height/3)
     let leadingConstraint = bannerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 3)
     let trailingConstraint = bannerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -3)
     
     NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
     }
     
     func configureContentStackView() {
     
     contentStackView.axis = .vertical
     contentStackView.distribution = .fill
     contentStackView.alignment = .fill
     contentStackView.spacing = 10
     
     contentStackView.translatesAutoresizingMaskIntoConstraints = false
     let topConstraint = contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
     let bottomConstraint = contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
     let leadingConstraint = contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
     let trailingConstraint = contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
     
     NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
     }
     func configureDiscountStackView() {
     
     
     }
     */
}
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}

