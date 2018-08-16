//
//  SearchPresenter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol SearchPresenterInput: AuthorizedPresenter {
    func present(randomPhotos: [Photo])
    func randomPhotosFailedToLoad()
}

class SearchPresenter {
    var output: SearchViewControllerInput?
}

extension SearchPresenter: SearchPresenterInput {
    func present(webModalViewController: WebModalViewController) {
        
    }
    
    func showUserView(with user: User) {
        
    }
    
    func showLoginView() {
        
    }
    
    func showFetchUserError() {
        
    }
    
    func tokenReceived() {
        
    }
    
    func tokenMissing() {
        
    }
    
    func tokenFailedToSave() {
        
    }
    
    func randomPhotosFailedToLoad() {
        
    }
    
    func present(randomPhotos: [Photo]) {
        let photosCollectionViewDataSource = PhotosCollectionViewDataSource(data: randomPhotos.map { return (id: $0.id, imageUrl: $0.small) })
        output?.randomPhotosReceived(dataSource: photosCollectionViewDataSource)
    }
}
