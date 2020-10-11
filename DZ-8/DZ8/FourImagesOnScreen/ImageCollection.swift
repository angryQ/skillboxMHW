//
//  Category.swift
//  DZ8
//
//  Created by Kristina Kudinova on 14.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import Foundation
import UIKit

struct Item {
    
    var name: String
    var image: UIImage
}

class ImageCollection {
    
    var images = [Item]()
    
    init() {
        setup()
    }
    
    func setup() {
        
        let item1 = Item(name: "Картинка #1", image: UIImage(named: "pic-10")!)
        let item2 = Item(name: "Картинка #2", image: UIImage(named: "pic-3")!)
        let item3 = Item(name: "Картинка #3", image: UIImage(named: "pic-9")!)
        let item4 = Item(name: "Картинка #4", image: UIImage(named: "pic-8")!)
        
        self.images = [item1, item2, item3, item4]
    }
}
