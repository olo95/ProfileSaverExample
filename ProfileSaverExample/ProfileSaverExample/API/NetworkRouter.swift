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
        switch self {
        default:
            return ""
        }
    }
    
    var requestType: String? {
        switch self {
        default:
            return "GET"
        }
    }
    
    var parameters: [URLQueryItem]? {
        guard let infoPlist = InfoPlist.getInfoPlist() else { return nil }
        switch self {
        case .authorize:
            return [URLQueryItem(name: "client_id", value: infoPlist.apiAccessKey),
                    URLQueryItem(name: "redirect_uri", value: infoPlist.redirectUri),
                    URLQueryItem(name: "response_type", value: "code"),
                    URLQueryItem(name: "scope", value: "public+read_user")]
        case .token(let code):
            return [URLQueryItem(name: "client_id", value: infoPlist.apiAccessKey),
                    URLQueryItem(name: "client_secret", value: infoPlist.apiSecretAccessKey),
                    URLQueryItem(name: "redirect_uri", value: ""),
                    URLQueryItem(name: "code", value: code),
                    URLQueryItem(name: "grant_type", value: "authorization_code")]
        default:
            return []
        }
    }
    
    var bodyParameters: Data? {
        switch self {
        default:
            return nil
        }
    }
    
    var headers: [(key: String, value: String)]? {
        switch self {
        default:
            return []
        }
    }
    
    
}
