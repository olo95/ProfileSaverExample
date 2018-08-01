//
//  ProfilePresenter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol ProfilePresenterInput: class {
    
}

class ProfilePresenter {
    weak var output: ProfileViewControllerInput?
}

extension ProfilePresenter: ProfilePresenterInput {
    
}
