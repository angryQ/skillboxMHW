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

class Store {
    var items = [Item]()
    
    init(){
        setup()
    }
    
    func setup(){
        let item1 = Item(name: "Товар 1", image: UIImage(named: "water")!)
        let item2 = Item(name: "Товар 2", image: UIImage(named: "winter2")!)
        let item3 = Item(name: "Товар 3", image: UIImage(named: "alpy")!)
        let item4 = Item(name: "Товар 4", image: UIImage(named: "autumn2")!)
        
        self.items = [item1, item2, item3, item4]
    }
}
