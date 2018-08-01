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
    
    private let searchViewController: SearchViewController = {
        let viewController = SearchViewController()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter()
        let worker = SearchWorker()
        let router = SearchRouter()
        viewController.output = interactor
        interactor.output = presenter
        presenter.output = viewController
        return viewController
    }()
    
    private init() {
        super.init(nibName: nil, bundle: nil)
        initializeViewControllers()
    }
    
    private func initializeViewControllers() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
