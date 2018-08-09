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
    func showLoginView()
    func tokenReceived()
    func tokenMissing()
    func tokenFailedToSave()
}

class LoginPresenter {
    var output: LoginViewControllerInput?
}

extension LoginPresenter: LoginPresenterInput {
    
    func present(webModalViewController: WebModalViewController) {
        output?.present(webModalViewController: webModalViewController)
    }
    
    func tokenReceived() {
        
    }
    
    func tokenMissing() {
        
    }
    
    func tokenFailedToSave() {
        
    }
    
    func showLoginView() {
        output?.showLoginView()
    }
}
