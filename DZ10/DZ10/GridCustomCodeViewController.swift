//
//  GridCustomCodeViewController.swift
//  DZ10
//
//  Created by Kristina Kudinova on 02.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class GridCustomCodeViewController: UIViewController {
    
    var holderView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        createGrid()
    }
    
    private func createGrid() {
        let countOfRowsOnScreen: CGFloat = 4
        
        let navigationBarHeight = (self.navigationController?.navigationBar.frame.height)!
        let viewHeightWithoutNavigationBar = self.view.safeAreaLayoutGuide.layoutFrame.size.height - navigationBarHeight
        let paddingLeftForHolderView: CGFloat = 10
        
        self.view.addSubview(holderView)
        
        holderView.frame = CGRect(x: paddingLeftForHolderView, y: self.view.safeAreaLayoutGuide.layoutFrame.origin.y + navigationBarHeight, width:  self.view.bounds.width - paddingLeftForHolderView * 2, height: viewHeightWithoutNavigationBar - 60)
        
        let paddingBottom: CGFloat = 5 //отступ между строками
        let paddingVertical: CGFloat = 5 //отступ между колонками
        
        var yPos: CGFloat = 0 // "у" для отсчета позиции элемента
        
        let heightPerItem =  (holderView.bounds.height - paddingBottom * (countOfRowsOnScreen - 1)) / countOfRowsOnScreen
        let holderViewWidth = holderView.bounds.width
        let shortViewWidth = (holderViewWidth - paddingVertical) / 2
        
        for _ in  0...1 {
            
            let longView = createView(frame: CGRect(x: 0, y: yPos, width: holderView.bounds.width, height: heightPerItem))
            holderView.addSubview(longView)
            
            let shortView1 = createView(frame: CGRect(x: 0, y: yPos + heightPerItem + paddingBottom, width: shortViewWidth, height: heightPerItem))
            holderView.addSubview(shortView1)
            
            let shortView2 = createView(frame: CGRect(x: shortViewWidth + paddingVertical, y: yPos + heightPerItem + paddingBottom, width: shortViewWidth, height: heightPerItem))
            holderView.addSubview(shortView2)
            
            yPos = (heightPerItem ) * 2 + 10
        }
    }
    func createView(frame: CGRect) -> UIView {
        let itemView = UIView()
        itemView.backgroundColor = .systemPink
        itemView.frame = frame
        
        return itemView
    }
}
