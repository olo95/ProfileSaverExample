//
//  UserCollection.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 14/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct UserCollection {
    var id: Int
    var title: String
    var publishedAt: String
    var updatedAt: String
    var curated: Bool
    var coverPhoto: String?
    var user: User?
    
    enum UserCollectionKeys: String, CodingKey {
        case id
        case title
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case curated
        case coverPhoto = "cover_photo"
        case user
    }
}

extension UserCollection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserCollectionKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        publishedAt = try container.decode(String.self, forKey: .publishedAt)
        updatedAt = try container.decode(String.self, forKey: .updatedAt)
        curated = try container.decode(Bool.self, forKey: .curated)
        coverPhoto = try container.decodeIfPresent(String.self, forKey: .coverPhoto)
        user = try container.decodeIfPresent(User.self, forKey: .user)
    }
}
