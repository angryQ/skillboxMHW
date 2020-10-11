//
//  fourItemsViewController.swift
//  DZ8
//
//  Created by Kristina Kudinova on 14.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ImageCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var store: ImageCollection = ImageCollection()
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}

extension ImageCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    
    //Указываем количество ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return store.images.count
    }
    
    //Указываем то что хранится в ячейке
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        let item = store.images[indexPath.item]
        cell.setupCell(item: item)
        
        return cell
    }
    
    //Указываем размер ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - padding
        let widthPerItem = availableWidth / itemsPerRow
        let availableHeight = collectionView.frame.height - padding - 50
        let heightPerItem = availableHeight / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    //Добавляем вертикальные отступы между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInserts.left
    }
    
    //Центрируем картинки после добавления отступов между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInserts
    }
}


