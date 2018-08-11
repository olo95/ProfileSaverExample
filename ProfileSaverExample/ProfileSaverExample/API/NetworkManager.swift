//
//  NetworkManager.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 02/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func getToken(with authorizationCode: String, completionHandler: @escaping (Token?) -> ()) {
        guard let request = NetworkRouter.token(code: authorizationCode).request else {
            completionHandler(nil)
            return
        }
        make(request: request, completionHandler: { (response: Response) in
            switch response {
            case .success(let data):
                do {
                    completionHandler(try JSONDecoder().decode(Token.self, from: data))
                } catch {
                    print(error.localizedDescription)
                    completionHandler(nil)
                }
            case .failure(let description):
                print(description)
                completionHandler(nil)
            }
        })
    }
    
    func getUser(completionHandler: @escaping (User?) -> ()) {
        guard let request = NetworkRouter.user.request else {
            completionHandler(nil)
            return
        }
        make(request: request, completionHandler: { (response: Response) in
            switch response {
            case .success(let data):
                do {
                    completionHandler(try JSONDecoder().decode(User.self, from: data))
                } catch {
                    print(error.localizedDescription)
                    completionHandler(nil)
                }
            case .failure(let description):
                print(description)
                completionHandler(nil)
            }
        })
    }
    
    private func make(request: URLRequest, completionHandler: @escaping (Response) -> ()) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error { completionHandler(Response.failure(description: error.localizedDescription)) }
            if let data = data { completionHandler(Response.success(data: data)) }
            }.resume()
    }
}
