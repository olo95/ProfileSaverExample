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
        make(request: request) { (token: Token?) in
            completionHandler(token)
        }
    }
    
    func getUser(completionHandler: @escaping (User?) -> ()) {
        guard let request = NetworkRouter.user.request else {
            completionHandler(nil)
            return
        }
        make(request: request) { (user: User?) in
            completionHandler(user)
        }
    }
    
    func getRandomPhotos(count: Int, completionHandler: @escaping ([Photo]?) -> ()) {
        guard let request = NetworkRouter.randomPhoto(count: count).request else {
            completionHandler(nil)
            return
        }
        makeArray(request: request) { (photos: [Photo]?) in
            completionHandler(photos)
        }
    }
    
    func getPhoto(with id: String, completionHandler: @escaping (Photo?) -> ()) {
        guard let request = NetworkRouter.photo(id: id).request else {
            completionHandler(nil)
            return
        }
        makeArray(request: request) { (photos: [Photo]?) in
            completionHandler(photos?.first)
        }
    }
    
    private func makeArray<T: Decodable>(request: URLRequest, completionHandler: @escaping ([T]?) -> ()) {
        execute(request: request, completionHandler: { (response: Response) in
            switch response {
            case .success(let data):
                do {
                    completionHandler(try JSONDecoder().decode([T].self, from: data))
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
    
    private func make<T: Decodable>(request: URLRequest, completionHandler: @escaping (T?) -> ()) {
        execute(request: request, completionHandler: { (response: Response) in
            switch response {
            case .success(let data):
                do {
                    completionHandler(try JSONDecoder().decode(T.self, from: data))
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
    
    private func execute(request: URLRequest, completionHandler: @escaping (Response) -> ()) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error { completionHandler(Response.failure(description: error.localizedDescription)) }
            if let data = data { completionHandler(Response.success(data: data)) }
            }.resume()
    }
}
