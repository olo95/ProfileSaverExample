//
//  LoginWorker.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

class LoginWorker {
    
    func requestToken(with authorizationCode: String, completionHandler: @escaping (Token?) -> ()) {
        NetworkManager.shared.getToken(with: authorizationCode) { token in
            completionHandler(token)
        }
    }
    
    func fetchUser(completionHandler: @escaping (User?) -> ()) {
        NetworkManager.shared.getUser() { user in
            DispatchQueue.main.async {
                completionHandler(user)
            }
        }
    }
}
