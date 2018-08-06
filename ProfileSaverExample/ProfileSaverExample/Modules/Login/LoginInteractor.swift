//
//  LoginInteractor.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol LoginInteractorInput: class {
    func onUserNotLoggedIn()
    func onUserLoggedIn()
}

class LoginInteractor {
    var output: LoginPresenterInput?
}

extension LoginInteractor: LoginInteractorInput {
    func onUserNotLoggedIn() {
        guard let stringPath = NetworkRouter.authorize.path, let authorizeUrl = URL(string: stringPath) else { return }
        output?.present(webModalViewController: WebModalViewController(with: authorizeUrl))
    }
    
    func onUserLoggedIn() {
        //download user with token
    }
}
