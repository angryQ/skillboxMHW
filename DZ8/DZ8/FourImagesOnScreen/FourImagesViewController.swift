//
//  ImagesInLoopViewController.swift
//  DZ8
//
//  Created by Kristina Kudinova on 01.10.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class FourImagesViewController: UIViewController {
    
    var store: ImageCollection = ImageCollection()
    @IBOutlet weak var holderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.backgroundColor
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //Устанавливаю размер и положение вью, вычитаю из ширины по 20 точек слева и справа, и от высоты высоту таббара
        holderView.frame = CGRect(x: 20, y: 20, width: self.view.bounds.width - 40, height: self.view.safeAreaLayoutGuide.layoutFrame.height - (self.tabBarController?.tabBar.frame.size.height)!)
        holderView.backgroundColor = Colors.backgroundColor
        
        addImagesToView()
    }
    
    private func addImagesToView() {
        
        let countOfRowsOnScreen: CGFloat = 2 //количество строк с картинками на экране
        var startIndexInSubArray = 0 //начальный индекс в срезе элементов массива для прохождения по нему циклом
        var endIndexInSubArray = 1 //конечный индекс в срезе элементов массива для прохождения по нему циклом
        
        let holderViewHeight = holderView.bounds.height
        
        let paddingUnderImage: CGFloat = 10 //отступ между картинкой и лэйблом
        let labelHeight: CGFloat = 20 //место под лэйбл
        let verticalPadding: CGFloat = 10 //отступ между колонками
        let paddingUnderLabel: CGFloat = 20
        
        var yPos: CGFloat = 0 // "у" для отсчета позиции элемента
        var xPos: CGFloat = 0 // "х" для точки отсчета позиции элемента
        
        let widthPerItem = holderView.bounds.width / countOfRowsOnScreen - verticalPadding
        let heightPerItem = holderViewHeight / countOfRowsOnScreen - paddingUnderImage - labelHeight
            - paddingUnderLabel
        
        //Проходим по всему массиву элементов, беря по 2 элемента и формируя из них строку из двух элементов
        while endIndexInSubArray < store.images.count {
            
            for item in store.images[startIndexInSubArray...endIndexInSubArray] {
                
                //Создаем картинку и лэйбл, устанавливаем в них значения и добавляем их на вью
                let imageView = UIImageView(image: item.image)
                
                imageView.frame = CGRect(x: xPos, y: yPos, width: widthPerItem, height: heightPerItem)
                imageView.imgViewCorners()
                
                let label = UILabel(frame: CGRect(x: xPos, y: yPos + heightPerItem + paddingUnderImage,
                                                  width: widthPerItem, height: labelHeight))
                label.text = item.name
                
                holderView.addSubview(imageView)
                holderView.addSubview(label)
                
                //устанавливаем "х" для второго элемента во вторую колонку
                xPos = holderView.frame.width / countOfRowsOnScreen + verticalPadding
            }
            //Устанавливаем "х" в первую колонку, а "у" на вторую строку
            yPos = holderViewHeight / countOfRowsOnScreen
            xPos = 0
            
            startIndexInSubArray += 2
            endIndexInSubArray += 2
        }
    }
}
extension UIImageView {
    func imgViewCorners() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}
