//
//  RequestTokenResponseBody.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 04/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct RequestTokenResponse {
    var accessToken: String
    var tokenType: String
    var scope: String
    var createdAt: Int
    
    enum RequestTokenResponseKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case scope
        case createdAt = "created_at"
    }
}

extension RequestTokenResponse: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RequestTokenResponseKeys.self)
        accessToken = try container.decode(String.self, forKey: .accessToken)
        tokenType = try container.decode(String.self, forKey: .tokenType)
        scope = try container.decode(String.self, forKey: .scope)
        createdAt = try container.decode(Int.self, forKey: .createdAt)
    }
}
//{
//    "access_token": "091343ce13c8ae780065ecb3b13dc903475dd22cb78a05503c2e0c69c5e98044",
//    "token_type": "bearer",
//    "scope": "public read_photos write_photos",
//    "created_at": 1436544465
//}
