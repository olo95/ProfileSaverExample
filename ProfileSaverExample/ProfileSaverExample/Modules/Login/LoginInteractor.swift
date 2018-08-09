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
    var worker = LoginWorker()
}

extension LoginInteractor: LoginInteractorInput {
    func onUserNotLoggedIn() {
        output?.showLoginView()
//        guard let stringPath = NetworkRouter.authorize.path, let authorizeUrl = URL(string: stringPath) else { return }
//        output?.present(webModalViewController: WebModalViewController(with: authorizeUrl, delegate: self))
    }
    
    func onUserLoggedIn() {
        //download user with token
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
