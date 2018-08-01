//
//  SearchPresenter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol SearchPresenterInput: class {
    
}

class SearchPresenter {
    weak var output: SearchViewControllerInput?
}

extension SearchPresenter: SearchPresenterInput {
    
}
