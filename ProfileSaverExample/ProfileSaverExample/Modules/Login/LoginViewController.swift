//
//  LoginViewController.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol LoginViewControllerInput: AuthorizedViewController {
    func showUserView(with user: User)
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
        setupButtons()
    }
    
    private func setupButtons() {
        mainView.noUserLoggedView.noUserLoadedLoginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loginButtonTapped)))
    }
    
    @objc private func loginButtonTapped() {
        output?.onLogin()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        determineView()
    }
    
    private func determineView() {
        KeychainManager.shared.isValidatedTokenExist() ? output?.onUserLoggedIn() : output?.onUserNotLoggedIn()
    }
}

extension LoginViewController: LoginViewControllerInput {
    func showLoginView() {
        mainView.addNoUserLoggedView()
    }
    
    func present(webModalViewController: WebModalViewController) {
        router?.present(viewController: webModalViewController)
    }
    
    func showUserView(with user: User) {
        mainView.addUserView(with: user)
    }
    
    func tokenReceived() {
        determineView()
    }
}
