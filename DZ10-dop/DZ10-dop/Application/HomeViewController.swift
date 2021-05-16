//
//  ViewController.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 19.01.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var contentView: UIView!
    var isFirstLaunch = true
    
    var items: [(String, UIView)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [("Scroll View с горизонтальным скролом", HorizontalScroll()),
                 ("Scroll View с горизонтальным и вертикальным скролом", HorizontalAndVerticalScrollView()),
                 ("Галерея фотографий с помощью Scroll View", GalleryWithScrollView()),
                 ("Stack View внутри Scroll View", ScrollWithStackView()),
                 ("Галерея фотографий с использованием таблицы и коллекции", TableAndCollectionView())]
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        contentView.layer.cornerRadius = 25
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentView.clipsToBounds = true
        registerNib()
    }
    override func viewDidAppear(_ animated: Bool) {
        if isFirstLaunch == true {
            menuCollectionView.cellForItem(at: IndexPath(item: 0, section: 0))?.contentView.backgroundColor = #colorLiteral(red: 0.4078431373, green: 0.7333333333, blue: 0.7803921569, alpha: 1)
            let v = HorizontalScroll()
            contentView.addSubview(v)
            v.frame.size = contentView.frame.size
        }
    }
    
    private func registerNib() {
        let nib = UINib(nibName: MenuCollectionViewCell.nibName, bundle: nil)
        menuCollectionView?.register(nib, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseIdentifier)
    }
}

//Настраиваем CollectionView от меню
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseIdentifier,
                                                             for: indexPath) as? MenuCollectionViewCell {
            let text = items[indexPath.row].0
            cell.configureCell(cellText: text)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isFirstLaunch == true {
            if let cell = collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? MenuCollectionViewCell {
                cell.deselectCell()
            }
            contentView.addSubview(items[0].1)
            isFirstLaunch = false
        }
        if contentView.subviews.count > 0 {
            contentView.subviews.forEach {
                $0.removeFromSuperview()
            }
        }
        let view = items[indexPath.row].1
        contentView.addSubview(view)
        view.frame.size = contentView.frame.size
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        if let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell {
            cell.selectCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell {
            cell.deselectCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell {
            cell.deselectCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell {
            cell.deselectCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, insetForSectionAt: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 120)
    }
}
