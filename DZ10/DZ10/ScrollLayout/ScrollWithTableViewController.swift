//
//  ScrollWithTableViewController.swift
//  DZ10
//
//  Created by Kristina Kudinova on 15.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

struct Place {
    var name: String
    var images: [UIImage]
    var type: String
    var description: String
    var address: String
    var orderComment: String
    var discount: Float
    var rate: Float
}
class ScrollWithTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let place = Place(
        name: "Бургерная Джо",
        images: [UIImage(named: "burger")!],
        type: "Американская кухня",
        description: "Что нужно для того, чтобы приготовить самые вкусные бургеры? Сперва, это качественные ингредиенты.",
        address: "Петровский бульв., 9",
        orderComment: "Депозит составляет 100 ₽. При отмене брони, менее чем за 2 часа депозит удерживается",
        discount: 20,
        rate: 5.0)
    
    var tableCells: [UITableViewCell] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SimpleTableViewCell.self, forCellReuseIdentifier: SimpleTableViewCell.identifier)
        table.register(MainInfoTableViewCell.nib(), forCellReuseIdentifier: MainInfoTableViewCell.identifier)
        table.register(BannerTableViewCell.nib(), forCellReuseIdentifier: BannerTableViewCell.identifier)
        table.register(MapTableViewCell.nib(), forCellReuseIdentifier: MapTableViewCell.identifier)
        table.register(NarrowButtonTableViewCell.nib(), forCellReuseIdentifier: NarrowButtonTableViewCell.identifier)
        table.register(ActionButtonsTableViewCell.nib(), forCellReuseIdentifier: ActionButtonsTableViewCell.identifier)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        initTableViewCells()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    private func  initTableViewCells() {
        let bannerCell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.identifier) as! BannerTableViewCell
        bannerCell.configure(placeImage: place.images[0])
        //bannerCell.placeImage.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3).isActive = true
        
        let mainInfoCell = tableView.dequeueReusableCell(withIdentifier: MainInfoTableViewCell.identifier) as! MainInfoTableViewCell
        mainInfoCell.configure(placeName: place.name, placeType: place.type, discount: place.discount, rate: place.rate)
        
        let placeDescriptionCell = tableView.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier) as! SimpleTableViewCell
        placeDescriptionCell.textLabel?.text = place.description
        placeDescriptionCell.textLabel?.numberOfLines = 0
        placeDescriptionCell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        let menuButtonCell = tableView.dequeueReusableCell(withIdentifier: NarrowButtonTableViewCell.identifier) as! NarrowButtonTableViewCell
        menuButtonCell.configure(buttonText: "МЕНЮ")
        
        let mapCell = tableView.dequeueReusableCell(withIdentifier: MapTableViewCell.identifier) as! MapTableViewCell
        mapCell.configure(placeAddress: place.address)
        
        let orderCommentCell = tableView.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier) as! SimpleTableViewCell
        orderCommentCell.textLabel?.text = place.orderComment
        orderCommentCell.textLabel?.numberOfLines = 0
        orderCommentCell.textLabel?.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        orderCommentCell.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        let actionButtonsCell = tableView.dequeueReusableCell(withIdentifier: ActionButtonsTableViewCell.identifier) as! ActionButtonsTableViewCell
        actionButtonsCell.configure()
        
        tableCells.append(contentsOf: [bannerCell, mainInfoCell, placeDescriptionCell, menuButtonCell, mapCell, orderCommentCell, actionButtonsCell])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableCells[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCells.count
    }
}
