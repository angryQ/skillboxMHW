//
//  Grid2x2CodeViewController.swift
//  DZ10
//
//  Created by Kristina Kudinova on 24.11.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class Grid3x3CodeViewController: UIViewController {
    
    var holderView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        createGrid()
    }
    private func createGrid() {
        let countOfRowsOnScreen: CGFloat = 3
        let countOfItemsPerRow: CGFloat = 3
        
        var startIndexInSubArray = 0 //начальный индекс в срезе элементов массива для прохождения по нему циклом
        var endIndexInSubArray = 2 //конечный индекс в срезе элементов массива для прохождения по нему циклом
        
        let navigationBarHeight = (self.navigationController?.navigationBar.frame.height)!
        let viewHeightWithoutNavigationBar = self.view.safeAreaLayoutGuide.layoutFrame.size.height - navigationBarHeight
        let paddingLeftForHolderView: CGFloat = 10
        
        self.view.addSubview(holderView)
        
        holderView.frame = CGRect(x: paddingLeftForHolderView, y: (viewHeightWithoutNavigationBar / 3), width:  self.view.bounds.width - paddingLeftForHolderView * 2, height: viewHeightWithoutNavigationBar / 2)
        
        let paddingBottom: CGFloat = 5 //отступ между строками
        let paddingVertical: CGFloat = 5 //отступ между колонками
        
        var yPos: CGFloat = 0 // "у" для отсчета позиции элемента
        var xPos: CGFloat = 0 // "х" для точки отсчета позиции элемента
        
        let widthPerItem = (holderView.bounds.width - paddingVertical * (countOfItemsPerRow - 1)) / countOfItemsPerRow
        let heightPerItem =  (holderView.bounds.height - paddingBottom * (countOfRowsOnScreen - 1)) / countOfRowsOnScreen
        
        var row: CGFloat = 0
        //Проходим по всему массиву элементов, беря по 3 элемента и формируя из них строку из двух элементов
        while endIndexInSubArray < Int(countOfItemsPerRow * countOfRowsOnScreen) {
            
            var column: CGFloat = 0
            for _ in  startIndexInSubArray...endIndexInSubArray {
                //создаем вью и добавляем их на родительскую вью
                let itemView = UIView()
                itemView.backgroundColor = .systemPink
                itemView.frame = CGRect(x: xPos, y: yPos, width: widthPerItem, height: heightPerItem)
                holderView.addSubview(itemView)
                
                //увеличиваем колонку и устанавливаем "х" для следующего элемента в следующую колонку
                column += 1
                xPos = (widthPerItem + paddingVertical) * column
            }
            
            //увеличиваем строку и станавливаем "х" в первую колонку, а "у" на следующую строку
            row += 1
            yPos = (heightPerItem + paddingBottom) * row
            xPos = 0
            
            startIndexInSubArray += 3
            endIndexInSubArray += 3
        }
    }
}
