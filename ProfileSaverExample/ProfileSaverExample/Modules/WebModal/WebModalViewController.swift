//
//  WebModalViewController.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 05/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class WebModalViewController: UIViewController {
    
    private lazy var mainView: WebModalView = {
       return view as! WebModalView
    }()
    
    override func loadView() {
        view = WebModalView()
    }
}
