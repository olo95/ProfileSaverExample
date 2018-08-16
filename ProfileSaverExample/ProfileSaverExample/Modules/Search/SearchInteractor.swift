//
//  SearchInteractor.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol SearchInteractorInput: AuthorizedInteractor {
    func getRandomPhotos()
}

class SearchInteractor {
    var output: SearchPresenterInput?
    let worker = SearchWorker()
}

extension SearchInteractor: SearchInteractorInput {
    func onUserNotLoggedIn() {
        output?.showLoginView()
    }
    
    func onUserLoggedIn() {
        output?.showSearchView()
    }
    
    func onLogin() {
        guard let stringPath = NetworkRouter.authorize.path, let authorizeUrl = URL(string: stringPath) else { return }
        output?.present(webModalViewController: WebModalViewController(with: authorizeUrl, delegate: self))
    }
    
    func getRandomPhotos() {
        worker.getRandomPhotos(count: 8) { [weak self] photos in
            guard let `self` = self else { return }
            guard let photos = photos else {
                self.output?.randomPhotosFailedToLoad()
                return
            }
            self.output?.present(randomPhotos: photos)
        }
    }
}

extension SearchInteractor: WebModalViewOutput {
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
