//
//  Photo.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 14/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct Photo {
    var id: String
    var createdAt: String
    var updatedAt: String
    var width: Int
    var height: Int
    var color: String
    var downloads: Int
    var likes: Int
    var likedByUser: Bool
    var description: String
    var exif: Exif
    var location: Location
    var currentUserCollections: [UserCollection]
    var urls: [URL]
//    var categories: [String]
    var links: [URL]
    var user: User
    
    enum PhotoKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width
        case height
        case color
        case downloads
        case likes
        case liked_by_user
        case description
        case exif
        case location
        case currentUserCollections = "current_user_collections"
        case urls
        case categories
        case links
        case user
    }
}

extension Photo: Decodable {
    init(from decoder: Decoder) throws {
        
    }
}
