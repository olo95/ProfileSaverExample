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
    case token
    
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
        switch self {
        case .authorize:
            return nil
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
