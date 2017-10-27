//
//  BasicNavigationViewController.swift
//  BookBrowser
//
//  Created by Hanson on 2017/10/27.
//  Copyright © 2017年 hanson. All rights reserved.
//

import UIKit

class BasicNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
