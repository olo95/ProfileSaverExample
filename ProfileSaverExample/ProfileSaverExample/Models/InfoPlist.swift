//
//  InfoPlist.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 03/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct InfoPlist {
    
    static let shared: InfoPlist? = getInfoPlist()
    var baseUrl: String
    var baseOauthUrl: String
    var redirectUri: String
    var apiAccessKey: String
    var apiSecretAccessKey: String
    
    enum InfoPlistCodingKeys: String, CodingKey {
        case baseUrl = "BaseURL"
        case baseOauthUrl = "BaseOauthURL"
        case redirectUri = "RedirectURI"
        case apiAccessKey = "APIAccessKey"
        case apiSecretAccessKey = "APISecretAccesKey"
    }
}

extension InfoPlist: Decodable {
    
    private static func getInfoPlist() -> InfoPlist? {
        guard let url = Bundle.main.url(forResource: "Info", withExtension: "plist"),
              let data = try? Data(contentsOf: url) else { return nil }
        
        return try? PropertyListDecoder().decode(InfoPlist.self, from: data)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: InfoPlistCodingKeys.self)
        baseUrl = try container.decode(String.self, forKey: .baseUrl)
        baseOauthUrl = try container.decode(String.self, forKey: .baseOauthUrl)
        apiAccessKey = try container.decode(String.self, forKey: .apiAccessKey)
        apiSecretAccessKey = try container.decode(String.self, forKey: .apiSecretAccessKey)
        redirectUri = try container.decode(String.self, forKey: .redirectUri)
    }
}
