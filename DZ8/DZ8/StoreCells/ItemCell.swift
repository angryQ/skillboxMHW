//
//  ItemCell.swift
//  DZ8
//
//  Created by Kristina Kudinova on 14.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemImage.contentMode = .scaleAspectFit
    }
    
    //Чтобы у нас пока подгружаются новые картинки на их месте не отображались старые
     /*  override func prepareForReuse() {
           super.prepareForReuse()
           self.itemImage.image = nil
       }*/
    func setupCell(item: Item){
        self.itemImage.image = item.image
        self.itemNameLabel.text = item.name
        
       }
}
