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
    var output: ProfileInteractorInput?
    var router: ProfileRouterInput?
    
    private lazy var mainView: ProfileView = {
        return view as! ProfileView
    }()
    
    override func loadView() {
        view = ProfileView()
    }
}

extension ProfileViewController: ProfileViewControllerInput {
    
}
