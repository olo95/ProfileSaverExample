//
//  TabBarViewController.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    static let shared = TabBarViewController()
    private init() {
        initializeViewControllers()
    }
    
    private func initializeViewControllers() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
