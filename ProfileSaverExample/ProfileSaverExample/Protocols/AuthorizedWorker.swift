//
//  AuthorizedWorker.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 16/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

protocol AuthorizedWorker {
    func requestToken(with authorizationCode: String, completionHandler: @escaping (Token?) -> ())
    func fetchUser(completionHandler: @escaping (User?) -> ())
}

extension AuthorizedWorker {
    
    func requestToken(with authorizationCode: String, completionHandler: @escaping (Token?) -> ()) {
        NetworkManager().getToken(with: authorizationCode) { token in
            DispatchQueue.main.async {
                completionHandler(token)
            }
        }
    }
    
    func fetchUser(completionHandler: @escaping (User?) -> ()) {
        NetworkManager().getUser() { user in
            DispatchQueue.main.async {
                completionHandler(user)
            }
        }
    }
}
