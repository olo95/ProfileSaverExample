//
//  ProfileViewController.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol ProfileViewControllerInput: class {
    
}

class ProfileViewController: UIViewController {
    weak var output: ProfileInteractorInput?
    weak var router: ProfileRouterInput?
}

extension ProfileViewController: ProfileViewControllerInput {
    
}
