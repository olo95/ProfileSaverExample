//
//  LoginViewController.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol LoginViewControllerInput: class {
    func present(webModalViewController: WebModalViewController)
    func showLoginView()
}

class LoginViewController: UIViewController {
    var output: LoginInteractorInput?
    var router: LoginRouterInput?
    
    private lazy var mainView: LoginView = {
        return view as! LoginView
    }()
    
    override func loadView() {
        view = LoginView()
    }
    
    override func viewDidLoad() {
        if let navigationController = navigationController {
            router = LoginRouter(navigationController: navigationController)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        KeychainManager.shared.isValidatedTokenExist ? output?.onUserLoggedIn() : output?.onUserNotLoggedIn()
    }
}

extension LoginViewController: LoginViewControllerInput {
    func showLoginView() {
        mainView.addNoUserLoggedView()
    }
    
    func present(webModalViewController: WebModalViewController) {
        router?.present(viewController: webModalViewController)
    }
}
