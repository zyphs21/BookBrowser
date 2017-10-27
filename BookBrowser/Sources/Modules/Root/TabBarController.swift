//
//  TabBarController.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/28.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension TabBarController {
    
    private func setUpView() {
        let home = UIViewController()
        addViewController(home, title: "", imageName: "icon-book")
        let discover = UIViewController()
        addViewController(discover, title: "", imageName: "icon-search")
        let me = UIViewController()
        addViewController(me, title: "", imageName: "icon-profile")
    }
    
    private func addViewController(_ controller: UIViewController, title: String, imageName: String) {
        let nav = UINavigationController(rootViewController: controller)
        addChildViewController(nav)
        controller.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), tag: 1)
        controller.tabBarItem.tag = childViewControllers.count - 1
        print(childViewControllers.count - 1)
    }
}
