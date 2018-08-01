//
//  LoginInteractor.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol LoginInteractorInput: class {
    
}

class LoginInteractor {
    weak var output: LoginPresenterInput?
}

extension LoginInteractor: LoginInteractorInput {
    
}
