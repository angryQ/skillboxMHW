//
//  imageCollection.swift
//  DZ10
//
//  Created by Kristina Kudinova on 17.11.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import Foundation
import UIKit

struct Item {

    var name: String
    var image: UIImage
    var oldPrice: Double
    var discount: Double
}

class ImageCollection {

    let images = [
        Item(name: "Картинка #1", image: UIImage(named: "pic-10")!, oldPrice: 13500, discount: 65),
        Item(name: "Картинка #2", image: UIImage(named: "pic-3")!, oldPrice: 13500, discount: 65),
        Item(name: "Картинка #3", image: UIImage(named: "pic-9")!, oldPrice: 13500, discount: 65),
        Item(name: "Картинка #4", image: UIImage(named: "pic-8")!, oldPrice: 13500, discount: 65),
        Item(name: "Картинка #5", image: UIImage(named: "pic-9")!, oldPrice: 13500, discount: 65),
        Item(name: "Картинка #6", image: UIImage(named: "pic-3")!, oldPrice: 13500, discount: 65)
        ]
}
