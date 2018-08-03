//
//  InfoPlist.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 03/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct InfoPlist {
    var baseUrl: String
    var baseOauthUrl: String
    var redirectUri: String
    var apiAccessKey: String
    var apiSecretAccessKey: String
    
    enum InfoPlistCodingKeys: String, CodingKey {
        case baseUrl = "BaseURL"
        case baseOauthUrl
        case redirectUri
        case apiAccessKey
        case apiSecretAccessKey
    }
}

extension InfoPlist: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: InfoPlistCodingKeys.self)
        baseUrl = try container.decode(String.self, forKey: .baseUrl)
    }
}
