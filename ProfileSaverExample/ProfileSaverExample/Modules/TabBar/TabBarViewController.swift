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
        
        viewController.tabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "image-search"), selectedImage: #imageLiteral(resourceName: "image-search"))
        viewController.tabBarItem.tag = 0
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
        
        viewController.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "user"), selectedImage: #imageLiteral(resourceName: "user"))
        viewController.tabBarItem.tag = 1
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
        
        viewController.tabBarItem = UITabBarItem(title: "Login", image: #imageLiteral(resourceName: "sign-in"), selectedImage: #imageLiteral(resourceName: "sign-in"))
        viewController.tabBarItem.tag = 2
        return viewController
    }()
    
    private init() {
        super.init(nibName: nil, bundle: nil)
        customizeTabBar()
        initializeViewControllers()
    }
    
    private func customizeTabBar() {
        tabBar.isTranslucent = true
    }
    
    private func initializeViewControllers() {
        viewControllers = [searchViewController, profileViewController, loginViewController]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let imageView = item.value(forKey: "view") as? UIView else { return }
        let increaseSizeRotationTransform = CGAffineTransform(scaleX: 1.25, y: 1.25).rotated(by: CGFloat.pi / 4)
        let animator = UIViewPropertyAnimator()
        animator.addAnimations {
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: UIViewKeyframeAnimationOptions.calculationModeCubic, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                    imageView.transform = increaseSizeRotationTransform
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.5, animations: {
                    imageView.transform = CGAffineTransform.identity
                })
            }, completion: nil)
        }
        animator.startAnimation()
    }
}
