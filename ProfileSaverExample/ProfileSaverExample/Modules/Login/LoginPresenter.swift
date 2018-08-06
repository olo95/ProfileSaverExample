//
//  LoginPresenter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol LoginPresenterInput: class {
    func present(webModalViewController: WebModalViewController)
}

class LoginPresenter {
    var output: LoginViewControllerInput?
}

extension LoginPresenter: LoginPresenterInput {
    func present(webModalViewController: WebModalViewController) {
        output?.present(webModalViewController: webModalViewController)
    }
}
