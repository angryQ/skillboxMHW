//
//  MyTableViewController.swift
//  DZ10
//
//  Created by Kristina Kudinova on 29.11.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

struct Setting {
    let title: String
    var comment: String
    let accessoryType: UITableViewCell.AccessoryType
    var switchIsHidden: Bool? = true
    var commentLabelStyle: CommentLabelType? = .standard
    var icon: UIImage?
}

class MyTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let settings = [
        [
            Setting(title: "Авиарежим", comment: "", accessoryType: .none, switchIsHidden: false),
            Setting(title: "Wi-Fi", comment: "Anvics-YOTA", accessoryType: .disclosureIndicator),
            Setting(title: "Blutooth", comment: "Вкл. ", accessoryType: .disclosureIndicator),
            Setting(title: "Сотовая связь", comment: "", accessoryType: .disclosureIndicator),
            Setting(title: "Режим модема", comment: "", accessoryType: .disclosureIndicator),
        ],
        [
            Setting(title: "Уведомления", comment: "", accessoryType: .disclosureIndicator),
            Setting(title: "Звуки", comment: "", accessoryType: .disclosureIndicator),
            Setting(title: "Тактильные сигналы", comment: "", accessoryType: .disclosureIndicator),
            Setting(title: "Не беспокоить", comment: "", accessoryType: .disclosureIndicator),
            Setting(title: "Экранное время", comment: "", accessoryType: .disclosureIndicator)
        ],
        [
            Setting(title: "Основные", comment: "1", accessoryType: .disclosureIndicator, commentLabelStyle: .red),
            Setting(title: "Пункт управления", comment: "", accessoryType: .disclosureIndicator),
            Setting(title: "Яркость", comment: "", accessoryType: .disclosureIndicator)
        ]
    ]
    
    let images: [UIImage] = [UIImage(systemName: "bookmark")!, UIImage(systemName: "person")!, UIImage(systemName: "globe")!, UIImage(systemName: "moon")!, UIImage(systemName: "cloud")!, UIImage(systemName: "location")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MyTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SettingTableViewCell
        let setting = settings[indexPath.section][indexPath.row]
        
        cell.settingImage.image = imageWithImage(image: images.shuffled().randomElement()!, scaledToSize: CGSize(width: 20, height: 20))
        cell.settingImage.backgroundColor = .random
        cell.accessoryType = setting.accessoryType
        cell.settingImage.tintColor = .white
        cell.titleLabel.text = setting.title
        cell.mySwitch.isHidden = setting.switchIsHidden!
        
        cell.commentLabel.text = setting.comment
        cell.commentLabel.textColor = setting.commentLabelStyle?.rawValue.textColor
        cell.commentLabel.backgroundColor = setting.commentLabelStyle?.rawValue.backgroundColor
        if let corderRadius = setting.commentLabelStyle?.rawValue.cornerRadius {
            cell.commentLabel.cornerRadius = corderRadius
        }
        if let maskToBounds = setting.commentLabelStyle?.rawValue.maskToBounds {
            cell.commentLabel.layer.masksToBounds = maskToBounds
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  settings.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 5
        }
        else {
            return tableView.rowHeight
        }
    }
    
    //метод не мой, взяла с интернета, меняю им размер картинки
    func imageWithImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!.withRenderingMode(.alwaysTemplate)
    }

}
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

enum CommentLabelType {
    case standard
    case red
    
    var rawValue: (textColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat, maskToBounds: Bool) {
        switch self {
            case .standard: return (textColor: UIColor.gray, backgroundColor: UIColor.clear, cornerRadius: 0, maskToBounds: false)
            case .red: return (textColor: UIColor.white, backgroundColor: UIColor.red, cornerRadius: 10, maskToBounds: true)
        }
    }
}
