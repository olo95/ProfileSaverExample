//
//  SearchViewController.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol SearchViewControllerInput: class {
    
}

class SearchViewController: UIViewController {
    weak var output: SearchInteractorInput?
    weak var router: SearchRouterInput?
    
    private lazy var mainView: SearchView = {
       return view as! SearchView
    }()
    
    override func loadView() {
        view = SearchView()
    }
}

extension SearchViewController: SearchViewControllerInput {
    
}
