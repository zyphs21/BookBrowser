//
//  MenuTableViewController.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/12.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var menuItems = ["文学作品", "流行作品", "文化作品", "生活作品", "经管作品", "科技作品"]
    var currentItem = "文学作品"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        self.tableView.register(UITableViewCell.self)
        //self.view.backgroundColor = UIColor(red:0.109, green:0.114, blue:0.128, alpha:1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor.white : UIColor.gray
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentItem = menuItems[indexPath.row]
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//
//        if(segue.identifier == "backToFirstViewSegue"){
//            let menuTableViewController = segue.sourceViewController as! MenuTableViewController
//            if let selectedRow = menuTableViewController.tableView.indexPathForSelectedRow?.row {
//                currentItem = menuItems[selectedRow]
//            }
//        }
//    }
}
