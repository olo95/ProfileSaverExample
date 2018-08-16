//
//  SearchViewController.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol SearchViewControllerInput: AuthorizedViewController {
    func randomPhotosReceived(dataSource: UICollectionViewDataSource)
}

class SearchViewController: UIViewController {
    var output: SearchInteractorInput?
    var router: SearchRouterInput?
    
    private lazy var mainView: SearchView = {
       return view as! SearchView
    }()
    
    override func loadView() {
        view = SearchView()
    }
    
    override func viewDidLoad() {
        if let navigationController = navigationController {
            router = SearchRouter(navigationController: navigationController)
        }
        if KeychainManager.shared.isValidatedTokenExist() {
            output?.getRandomPhotos()
        } else {
            
        }
    }
    
    private func setSearchButton() {
        mainView.photoSearchQueryButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchButtonTapped)))
    }
    
    @objc private func searchButtonTapped() {
        
    }
}

extension SearchViewController: SearchViewControllerInput {
    func present(webModalViewController: WebModalViewController) {
        
    }
    
    func showLoginView() {
        
    }
    
    func showUserView(with user: User) {
        
    }
    
    func tokenReceived() {
        
    }
    
    func randomPhotosReceived(dataSource: UICollectionViewDataSource) {
        mainView.randomPhotosCollectionView.dataSource = dataSource
    }
}
