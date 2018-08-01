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
        viewController.router = router
        interactor.output = presenter
        presenter.output = viewController
        return viewController
    }()
    
    private let profileViewController: ProfileViewController = {
        let viewController = ProfileViewController()
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter()
        let worker = ProfileWorker()
        let router = ProfileRouter()
        viewController.output = interactor
        viewController.router = router
        interactor.output = presenter
        presenter.output = viewController
        return viewController
    }()
    
    private let loginViewController: LoginViewController = {
        let viewController = LoginViewController()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let worker = LoginWorker()
        let router = LoginRouter()
        viewController.output = interactor
        viewController.router = router
        interactor.output = presenter
        presenter.output = viewController
        return viewController
    }()
    
    private init() {
        super.init(nibName: nil, bundle: nil)
        initializeViewControllers()
    }
    
    private func initializeViewControllers() {
        viewControllers = [searchViewController, profileViewController, loginViewController]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
