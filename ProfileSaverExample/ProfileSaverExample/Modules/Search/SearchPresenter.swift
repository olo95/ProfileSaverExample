//
//  SearchPresenter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol SearchPresenterInput: class {
    func present(randomPhotos: [Photo])
    func randomPhotosFailedToLoad()
}

class SearchPresenter {
    var output: SearchViewControllerInput?
}

extension SearchPresenter: SearchPresenterInput {
    func randomPhotosFailedToLoad() {
        
    }
    
    func present(randomPhotos: [Photo]) {
        let photosCollectionViewDataSource = PhotosCollectionViewDataSource(data: randomPhotos.map { return (id: $0.id, imageUrl: $0.small) })
        output?.randomPhotosReceived(dataSource: photosCollectionViewDataSource)
    }
}
