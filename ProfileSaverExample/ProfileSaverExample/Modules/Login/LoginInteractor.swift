//
//  LoginInteractor.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol LoginInteractorInput: AuthorizedInteractor {
//    func onUserNotLoggedIn()
//    func onUserLoggedIn()
//    func onLogin()
}

class LoginInteractor {
    var output: LoginPresenterInput?
    var worker = LoginWorker()
}

extension LoginInteractor: LoginInteractorInput {
    func onUserNotLoggedIn() {
        output?.showLoginView()
    }
    
    func onUserLoggedIn() {
        worker.fetchUser(completionHandler: { [weak self] user in
            if let user = user {
                self?.output?.showUserView(with: user)
            } else {
                self?.output?.showFetchUserError()
            }
        })
    }
    
    func onLogin() {
        guard let stringPath = NetworkRouter.authorize.path, let authorizeUrl = URL(string: stringPath) else { return }
        output?.present(webModalViewController: WebModalViewController(with: authorizeUrl, delegate: self))
    }
}

extension LoginInteractor: WebModalViewOutput {
    func didReceive(authenticationCode: String) {
        worker.requestToken(with: authenticationCode, completionHandler: { [weak self] token in
            if let token = token {
                do {
                    try KeychainManager.shared.save(token)
                } catch {
                    self?.output?.tokenFailedToSave()
                }
                self?.output?.tokenReceived()
            } else {
                self?.output?.tokenMissing()
            }
        })
    }
}
