//
//  LoginPresenter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol LoginPresenterInput: class {
    
}

class LoginPresenter {
    weak var output: LoginViewControllerInput?
}

extension LoginPresenter: LoginPresenterInput {
    
}
