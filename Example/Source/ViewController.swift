//
//  ViewController.swift
//  ViewStyleExample
//
//  Created by Konka on 2017/2/1.
//  Copyright © 2017年 Minya. All rights reserved.
//

import UIKit
import ViewStyle

class ViewController: UIViewController {
    
    var tableView: UITableView?
    
    struct DataStruct {
        let title: String
        let controller: AnyClass
    }
    
    var data: [DataStruct] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "View Style Example"
        
        data = [
            DataStruct(title: "UIView", controller: ViewViewController.self),
            DataStruct(title: "UIControl", controller: ControlViewController.self)
        ]
        
        tableView = UITableView(frame: self.view.bounds)
        tableView!.dataSource = self
        tableView!.delegate = self
        tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        tableView!.mi_styles = self.tableViewStyle
        
        self.view.addSubview(tableView!)
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let clazz = data[indexPath.row].controller as! UIViewController.Type
        let controller = clazz.init()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")
        cell?.textLabel?.text = data[indexPath.row].title
        return cell!
    }
}

// MARK: - Table View Style

extension ViewController {
    var tableViewStyle: [MIProperty: Any] {
        return [
            .rowHeight: 60,
            .separatorStyle: UITableViewCellSeparatorStyle.singleLine,
            .separatorColor: UIColor.lightGray,
            .backgroundView: UIView(),
            .separatorInset: UIEdgeInsets(top: 10.0, left: 5.0, bottom: 3.0, right: 10.0),
            .cellLayoutMarginsFollowReadableWidth: true
        ]
    }
}
