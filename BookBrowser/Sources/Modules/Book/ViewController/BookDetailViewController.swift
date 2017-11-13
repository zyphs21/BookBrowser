//
//  BookDetailViewController.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/12.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    var stretchHeaderView: StretchHeaderView!
    var tableView: UITableView!
    var navigationView: UIView!
    
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        setUpView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}


// MARK: - Function

extension BookDetailViewController {
    
    private func setUpView() {
        navigationView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: 64))
        navigationView.backgroundColor = UIColor.white
        navigationView.alpha = 0.0
        
        stretchHeaderView = StretchHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: 222))
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight))
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = stretchHeaderView
        tableView.register(UITableViewCell.self)
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView!)
        self.view.addSubview(navigationView)
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension BookDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.layoutMargins = .zero
        cell.textLabel?.text = "test"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}


// MARK: - ScrollView Delegate

extension BookDetailViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset: CGFloat = scrollView.contentOffset.y
        stretchHeaderView.updateOffset(contentOffsetX: offset)
        if (offset > 50) {
            //            let alpha: CGFloat = min(CGFloat(1), CGFloat(1) - (CGFloat(50) + (navigationView.frame.height) - offset) / (navigationView.frame.height))
            let alpha: CGFloat = min(CGFloat(1), (offset - 50) / (navigationView.frame.height))
            navigationView.alpha = CGFloat(alpha)
            
        } else {
            navigationView.alpha = 0.0
        }
    }
}
