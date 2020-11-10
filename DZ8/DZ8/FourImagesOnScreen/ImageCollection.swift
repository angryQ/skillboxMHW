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
    
    let images = [
        Item(name: "Картинка #1", image: UIImage(named: "pic-10")!),
        Item(name: "Картинка #2", image: UIImage(named: "pic-3")!),
        Item(name: "Картинка #3", image: UIImage(named: "pic-9")!),
        Item(name: "Картинка #4", image: UIImage(named: "pic-8")!)
    ]
}
