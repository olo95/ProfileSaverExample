//
//  SearchInteractor.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol SearchInteractorInput: class {
    
}

class SearchInteractor {
    weak var output: SearchPresenterInput?
}

extension SearchInteractor: SearchInteractorInput {
    
}
