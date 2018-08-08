//
//  NetworkRouter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 02/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

enum NetworkRouter {
    case authorize
    case token(code : String)
    
    var path: String? {
        guard let infoPlist = InfoPlist.shared else { return nil }
        switch self {
        case .authorize:
            guard var urlComponents = URLComponents(string: infoPlist.baseOauthUrl + "authorize") else { return nil }
            urlComponents.queryItems = NetworkRouter.authorize.parameters
            return urlComponents.url?.absoluteString
        case .token:
            return URL(string: infoPlist.baseOauthUrl + "token")?.absoluteString
        }
    }
    
    var requestType: String? {
        switch self {
        case .authorize: return nil
        case .token: return "POST"
        }
    }
    
    private var parameters: [URLQueryItem] {
        guard let infoPlist = InfoPlist.shared else { return [] }
        switch self {
        case .authorize:
            return [URLQueryItem(name: "client_id", value: infoPlist.apiAccessKey),
                    URLQueryItem(name: "redirect_uri", value: infoPlist.redirectUri + "://bolo.com"),
                    URLQueryItem(name: "response_type", value: "code"),
                    URLQueryItem(name: "scope", value: "public")]
        case .token:
            return []
        }
    }
    
    private var bodyParameters: Data? {
        switch self {
        case .token(let code):
            guard let requestTokenBody = RequestTokenBody(with: code) else { return nil }
            return try? JSONEncoder().encode(requestTokenBody)
        default:
            return nil
        }
    }
    
    var headers: [(key: String, value: String)] {
        switch self {
        default:
            return []
        }
    }
    
    
}
