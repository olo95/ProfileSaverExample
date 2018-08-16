//
//  LoginPresenter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol LoginPresenterInput: AuthorizedPresenter {
    func showUserView(with user: User)
    func showSearchView()
}

class LoginPresenter {
    var output: LoginViewControllerInput?
}

extension LoginPresenter: LoginPresenterInput {
    
    func showUserView(with user: User) {
        output?.showUserView(with: user)
    }
    
    func showSearchView() {
        
    }
    
    func showFetchUserError() {
        
    }
    
    func present(webModalViewController: WebModalViewController) {
        output?.present(webModalViewController: webModalViewController)
    }
    
    func tokenReceived() {
        output?.tokenReceived()
    }
    
    func tokenMissing() {
        
    }
    
    func tokenFailedToSave() {
        
    }
    
    func showLoginView() {
        output?.showLoginView()
    }
}
