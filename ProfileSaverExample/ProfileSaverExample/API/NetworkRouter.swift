//
//  NetworkRouter.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 02/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

enum NetworkRouter {
    case user
    case authorize
    case token(code : String)
    
    var request: URLRequest? {
        switch self {
        case .token:
            guard let path = path, let url = URL(string: path), let bodyParameters = bodyParameters else { return nil }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpBody = bodyParameters
            urlRequest.httpMethod = requestType
            urlRequest.allHTTPHeaderFields = headers
            return urlRequest
        case .user:
            guard let path = path, let url = URL(string: path) else { return nil }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = requestType
            urlRequest.allHTTPHeaderFields = headers
            return urlRequest
        default:
            return nil
        }
    }
    
    var path: String? {
        guard let infoPlist = InfoPlist.shared else { return nil }
        switch self {
        case .user:
            guard let urlComponents = URLComponents(string: infoPlist.baseUrl + "me") else { return nil }
            return urlComponents.url?.absoluteString
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
        case .user: return "GET"
        case .token: return "POST"
        }
    }
    
    private var parameters: [URLQueryItem] {
        guard let infoPlist = InfoPlist.shared else { return [] }
        switch self {
        case .authorize:
            return [URLQueryItem(name: "client_id", value: infoPlist.apiAccessKey),
                    URLQueryItem(name: "redirect_uri", value: infoPlist.redirectUri + "://authorization.callback"),
                    URLQueryItem(name: "response_type", value: "code"),
                    URLQueryItem(name: "scope", value: "public read_user")]
        default:
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
    
    var headers: [String : String]? {
        switch self {
        case .user:
            guard let token = KeychainManager.shared.token() else { return nil }
            return ["Content-Type": "application/json", "Accept": "application/json", "Accept-Version": "v1", "Authorization": "Bearer \(token.rawValue)" ]
        default:
            return ["Content-Type": "application/json", "Accept": "application/json", "Accept-Version": "v1"]
        }
    }
}
