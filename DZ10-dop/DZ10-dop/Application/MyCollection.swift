//
//  MyCollection.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 19.01.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import Foundation
import UIKit

struct ImageCollection {
    var title: String
    var images: [UIImage]
    
    static var animals: ImageCollection = {
        let instance = ImageCollection(title: "Животные", images: [
        UIImage(named: "a01")!,
        UIImage(named: "a03")!,
        UIImage(named: "a04")!,
        UIImage(named: "a05")!,
        UIImage(named: "a06")!,
        UIImage(named: "a09")!,
        UIImage(named: "a10")!,
        UIImage(named: "a11")!,
        UIImage(named: "a12")!,
        UIImage(named: "c7")!])
        
        return instance
    }()
    static var nature: ImageCollection = {
        let instance = ImageCollection(title: "Природа", images: [
        UIImage(named: "n1")!,
        UIImage(named: "n2")!,
        UIImage(named: "n3")!,
        UIImage(named: "n4")!,
        UIImage(named: "n5")!,
        UIImage(named: "n6")!,
        UIImage(named: "n9")!,
        UIImage(named: "pl1")!])
        
        return instance
    }()
    static var arch: ImageCollection = {
        let instance = ImageCollection(title: "Архитектура", images: [
        UIImage(named: "ar1")!,
        UIImage(named: "ar2")!,
        UIImage(named: "ar3")!,
        UIImage(named: "ar4")!,
        UIImage(named: "ar5")!,
        UIImage(named: "ar6")!,
        UIImage(named: "ar7")!,
        UIImage(named: "ar9")!,
        UIImage(named: "b11")!])
        
        return instance
    }()
    static var people: ImageCollection = {
        let instance = ImageCollection(title: "Люди", images: [
        UIImage(named: "c2")!,
        UIImage(named: "c4")!,
        UIImage(named: "c8")!,
        UIImage(named: "p1")!,
        UIImage(named: "p4")!,
        UIImage(named: "p94")!,
        UIImage(named: "p6")!,
        UIImage(named: "p7")!,
        UIImage(named: "p08")!,
        UIImage(named: "p9")!,
        UIImage(named: "p09")!])
        
        return instance
    }()
    static var robots: ImageCollection = {
        let instance = ImageCollection(title: "Роботы", images: [
        UIImage(named: "r1")!,
        UIImage(named: "r3")!,
        UIImage(named: "r4")!,
        UIImage(named: "r5")!,
        UIImage(named: "r6")!,
        UIImage(named: "r7")!,
        UIImage(named: "r07")!,
        UIImage(named: "r08")!,
        UIImage(named: "r09")!,
        UIImage(named: "r12")!
        ])
        
        return instance
    }()
    static var space: ImageCollection = {
        let instance = ImageCollection(title: "Космос", images: [
        UIImage(named: "s1")!,
        UIImage(named: "s2")!,
        UIImage(named: "s3")!,
        UIImage(named: "s4")!,
        UIImage(named: "s5")!,
        UIImage(named: "s6")!,
        UIImage(named: "s7")!,
        UIImage(named: "s8")!
        ])
        
        return instance
    }()
}
