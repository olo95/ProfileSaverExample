//
//  SearchViewController.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol SearchViewControllerInput: AuthorizedViewController {
    func randomPhotosReceived(dataSource: PhotosCollectionViewDataSource)
    func showSearchView()
    func present(webModalViewController: WebModalViewController)
    func present(photoViewController: PhotoViewController)
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
    func present(photoViewController: PhotoViewController) {
        router?.present(viewController: photoViewController)
    }
    
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
    
    func randomPhotosReceived(dataSource: PhotosCollectionViewDataSource) {
        output?.received(randomPhotosCollectionViewDataSource: dataSource)
        mainView.randomPhotosCollectionView.delegate = self
        mainView.randomPhotosCollectionView.dataSource = dataSource
        mainView.randomPhotosCollectionView.reloadData()
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output?.randomPhotoTapped(with: indexPath)
    }
}
