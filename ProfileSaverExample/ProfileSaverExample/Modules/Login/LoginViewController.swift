//
//  LoginViewController.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol LoginViewControllerInput: class {
    
}

class LoginViewController: UIViewController {
    weak var output: LoginInteractorInput?
    weak var router: LoginRouterInput?
    
    private lazy var mainView: LoginView = {
        return view as! LoginView
    }()
    
    override func loadView() {
        view = LoginView()
    }
}

extension LoginViewController: LoginViewControllerInput {
    
}
