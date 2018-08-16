//
//  AuthorizedPresenter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 16/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol AuthorizedPresenter {
    func present(webModalViewController: WebModalViewController)
    func showLoginView()
    func showFetchUserError()
    func tokenReceived()
    func tokenMissing()
    func tokenFailedToSave()
}
