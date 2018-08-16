//
//  SearchRouter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol SearchRouterInput: class {
    func present(viewController: UIViewController)
}

class SearchRouter {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension SearchRouter: SearchRouterInput {
    func present(viewController: UIViewController) {
        viewController.modalPresentationStyle = .overCurrentContext
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
