//
//  TableAndCollectionView.swift
//  DZ10-dop
//
//  Created by Kristina Kudinova on 26.01.2021.
//  Copyright © 2021 Kristina Kudinova. All rights reserved.
//

import UIKit

class TableAndCollectionView: UIView {
    
    let tableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    var collections: [ImageCollection] = [ImageCollection.nature, ImageCollection.people, ImageCollection.robots]
    let padding: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        tableView.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        tableView.frame = CGRect(x: padding, y: 30, width: self.frame.width, height: self.frame.height)
    }
}

extension TableAndCollectionView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: collections[indexPath.section].images)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  collections.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.text = collections[section].title
        return label
    }
}
