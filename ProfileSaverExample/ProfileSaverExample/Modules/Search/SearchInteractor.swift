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
        
    }
    
    func onUserLoggedIn() {
        
    }
    
    func onLogin() {
        
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
