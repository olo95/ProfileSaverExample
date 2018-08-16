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
    func showSearchView()
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
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        determineView()
    }
    
    private func determineView() {
        KeychainManager.shared.isValidatedTokenExist() ? output?.onUserLoggedIn() : output?.onUserNotLoggedIn()
    }
    
    private func setupButtons() {
        mainView.photoSearchQueryButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchButtonTapped)))
        mainView.noUserLoggedView.noUserLoadedLoginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loginButtonTapped)))
    }
    
    @objc private func searchButtonTapped() {
        
    }
    
    @objc private func loginButtonTapped() {
        output?.onLogin()
    }
}

extension SearchViewController: SearchViewControllerInput {
    func present(webModalViewController: WebModalViewController) {
        router?.present(viewController: webModalViewController)
    }
    
    func showLoginView() {
        mainView.addNoUserLoggedView()
    }
    
    func showSearchView() {
        mainView.setMainLayout()
        output?.getRandomPhotos()
    }
    
    func tokenReceived() {
        determineView()
    }
    
    func randomPhotosReceived(dataSource: UICollectionViewDataSource) {
        mainView.randomPhotosCollectionView.dataSource = dataSource
    }
}
