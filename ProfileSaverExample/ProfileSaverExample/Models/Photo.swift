//
//  Photo.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 14/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct Photo {
    var id: String?
    var createdAt: String?
    var updatedAt: String?
    var width: Int
    var height: Int
    var color: String
    var downloads: Int?
    var likes: Int
    var likedByUser: Bool
    var description: String?
    var exif: Exif?
    var location: Location?
    var currentUserCollections: [UserCollection]?
//    var categories: [String]
    var user: User?
    
    var raw: URL
    var full: URL
    var regular: URL
    var small: URL
    var thumb: URL
    
    var selfLink: URL
    var html: URL
    var download: URL
    var downloadLocation: URL
    
    enum PhotoKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width
        case height
        case color
        case downloads
        case likes
        case likedByUser = "liked_by_user"
        case description
        case exif
        case location
        case currentUserCollections = "current_user_collections"
        case urls
        //        case categories
        case raw
        case full
        case regular
        case small
        case thumb
        case links
        case selfLink = "self"
        case html
        case download
        case downloadLocation = "download_location"
        case user
    }
}

extension Photo: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PhotoKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        updatedAt = try container.decode(String.self, forKey: .updatedAt)
        width = try container.decode(Int.self, forKey: .width)
        height = try container.decode(Int.self, forKey: .height)
        color = try container.decode(String.self, forKey: .color)
        downloads = try container.decodeIfPresent(Int.self, forKey: .downloads)
        likes = try container.decode(Int.self, forKey: .likes)
        likedByUser = try container.decode(Bool.self, forKey: .likedByUser)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        exif = try container.decodeIfPresent(Exif.self, forKey: .exif)
        location = try container.decodeIfPresent(Location.self, forKey: .location)
        currentUserCollections = try container.decodeIfPresent([UserCollection].self, forKey: .currentUserCollections)
        let urlsContainer = try container.nestedContainer(keyedBy: PhotoKeys.self, forKey: .urls)
        raw = try urlsContainer.decode(URL.self, forKey: .raw)
        full = try urlsContainer.decode(URL.self, forKey: .full)
        regular = try urlsContainer.decode(URL.self, forKey: .regular)
        small = try urlsContainer.decode(URL.self, forKey: .small)
        thumb = try urlsContainer.decode(URL.self, forKey: .thumb)
        //            categories = try container.decode(Double.self, forKey: .categories)
        let linksContainer = try container.nestedContainer(keyedBy: PhotoKeys.self, forKey: .links)
        selfLink = try linksContainer.decode(URL.self, forKey: .selfLink)
        html = try linksContainer.decode(URL.self, forKey: .html)
        download = try linksContainer.decode(URL.self, forKey: .download)
        downloadLocation = try linksContainer.decode(URL.self, forKey: .downloadLocation)
        user = try container.decodeIfPresent(User.self, forKey: .user)
    }
}
