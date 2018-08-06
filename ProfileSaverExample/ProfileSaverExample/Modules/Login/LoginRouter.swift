//
//  LoginRouter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol LoginRouterInput: class {
    func present(viewController: UIViewController)
}

class LoginRouter {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension LoginRouter: LoginRouterInput {
    func present(viewController: UIViewController) {
        viewController.modalPresentationStyle = .overCurrentContext
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
