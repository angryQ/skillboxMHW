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
    var switchIsHidden: Bool
    var icon: UIImage?
}

class MyTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let settings = [
        [
            Setting(title: "Авиарежим", comment: "", accessoryType: .none, switchIsHidden: false),
            Setting(title: "Wi-Fi", comment: "Anvics-YOTA", accessoryType: .disclosureIndicator, switchIsHidden: true),
            Setting(title: "Blutooth", comment: "Вкл. ", accessoryType: .disclosureIndicator, switchIsHidden: true),
            Setting(title: "Сотовая связь", comment: "", accessoryType: .disclosureIndicator, switchIsHidden: true),
            Setting(title: "Режим модема", comment: "", accessoryType: .disclosureIndicator, switchIsHidden: true)
        ],
        [
            Setting(title: "Уведомления", comment: "", accessoryType: .disclosureIndicator, switchIsHidden: true),
            Setting(title: "Звуки", comment: "", accessoryType: .disclosureIndicator, switchIsHidden: true),
            Setting(title: "Тактильные сигналы", comment: "", accessoryType: .disclosureIndicator, switchIsHidden: true),
            Setting(title: "Не беспокоить", comment: "", accessoryType: .disclosureIndicator, switchIsHidden: true),
            Setting(title: "Экранное время", comment: "", accessoryType: .disclosureIndicator, switchIsHidden: true)
        ],
        [
            Setting(title: "Основные", comment: "1", accessoryType: .disclosureIndicator, switchIsHidden: true),
            Setting(title: "Пункт управления", comment: "", accessoryType: .disclosureIndicator, switchIsHidden: true),
            Setting(title: "Яркость", comment: "", accessoryType: .disclosureIndicator, switchIsHidden: true)
        ]
    ]
    
    let images: [UIImage] = [UIImage(systemName: "bookmark")!, UIImage(systemName: "person")!, UIImage(systemName: "globe")!, UIImage(systemName: "moon")!, UIImage(systemName: "cloud")!, UIImage(systemName: "location")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle  = .fullScreen
        
        tableView.dataSource = self
    }
}

extension MyTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SettingTableViewCell
        let setting = settings[indexPath.section][indexPath.row]
        
        cell.settingImage.image = imageWithImage(image: images.shuffled().randomElement()!, scaledToSize: CGSize(width: 20, height: 20))
        cell.settingImage.backgroundColor = .random
        cell.settingImage.tintColor = .white
        cell.titleLabel.text = setting.title
        cell.mySwitch.isHidden = setting.switchIsHidden
        cell.commentLabel.text = setting.comment
        cell.accessoryType = setting.accessoryType
        
        if indexPath.section == 2 && indexPath.row == 0 {
            cell.commentLabel.backgroundColor = .red
            cell.commentLabel.layer.cornerRadius = 10
            cell.commentLabel.layer.masksToBounds = true
            cell.commentLabel.textColor = .white
            cell.mySwitch.isHidden = true
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  settings.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "" // изменение высоты хэдера почему-то не работает, поэтому скрываю первый хэдер
        } else {
            return " "
        }
    }
    //Почему-то не работает
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
