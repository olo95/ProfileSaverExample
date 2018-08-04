//
//  RequestTokenBody.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 04/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct RequestTokenBody {
    var clientId: String
    var clientSecret: String
    var redirectUri: String = ""
    var code: String
    var grantType: String = "authorization_code"
    
    enum RequestTokenBodyKeys: String, CodingKey {
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case redirectUri = "redirect_uri"
        case code
        case grantType = "grant_type"
    }
    
    init?(with code: String) {
        guard let plist = InfoPlist.shared else { return nil }
        self.code = code
        self.clientId = plist.apiAccessKey
        self.clientSecret = plist.apiSecretAccessKey
    }
}

extension RequestTokenBody: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RequestTokenBodyKeys.self)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(redirectUri, forKey: .redirectUri)
        try container.encode(code, forKey: .code)
        try container.encode(grantType, forKey: .grantType)
    }
}
