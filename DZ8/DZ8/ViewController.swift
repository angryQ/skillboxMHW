//
//  ViewController.swift
//  DZ8
//
//  Created by Kristina Kudinova on 12.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var galeryImageView: UIImageView!
    
    var picArray: [UIImage] = [UIImage(named: "autumn2")!, UIImage(named: "autumn3")!, UIImage(named: "winter2")!, UIImage(named: "alpy")!]
    var currentPicIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if let unwrappedImageView = galeryImageView {
            unwrappedImageView.contentMode = .scaleAspectFit
            unwrappedImageView.image = picArray[0]
        }
    }
    
    @IBAction func backButton() {
        currentPicIndex -= 1
        if currentPicIndex < 0{
            currentPicIndex = picArray.count-1
        }
        galeryImageView.image = picArray[currentPicIndex]
        
        
    }
    @IBAction func nextButton() {
        currentPicIndex += 1
        if currentPicIndex > picArray.count-1{
            currentPicIndex = 0
        }
        galeryImageView.image = picArray[currentPicIndex]
    }
    

}
