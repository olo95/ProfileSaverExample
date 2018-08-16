//
//  AuthorizedInteractor.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 16/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol AuthorizedInteractor {
    func onUserNotLoggedIn()
    func onUserLoggedIn()
    func onLogin()
}
