//
//  ProfileInteractor.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol ProfileInteractorInput: class {
    
}

class ProfileInteractor {
    var output: ProfilePresenterInput?
}

extension ProfileInteractor: ProfileInteractorInput {
    
}
