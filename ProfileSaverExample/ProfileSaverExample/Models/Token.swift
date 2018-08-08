//
//  Token.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 08/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct Token {
    var accessToken: String
    var tokenType: String
    var scope: [String]
    var createdAt: Int
    
    enum TokenKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case scope
        case createdAt = "created_at"
    }
}

extension Token: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TokenKeys.self)
        accessToken = try container.decode(String.self, forKey: .accessToken)
        tokenType = try container.decode(String.self, forKey: .tokenType)
        scope = try container.decode(String.self, forKey: .scope).components(separatedBy: " ")
        createdAt = try container.decode(Int.self, forKey: .createdAt)
    }
}
