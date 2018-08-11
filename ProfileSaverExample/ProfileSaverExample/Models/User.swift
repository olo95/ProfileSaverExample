//
//  User.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 10/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct User {
    var id: String
    var updatedAt: Date
    var username: String
    var firstName: String
    var lastName: String
    var twitterUsername: String
    var portfolioUrl: String?
    var bio: String
    var location: String
    var totalLikes: Int
    var totalPhotos: Int
    var totalCollections: Int
    var followedByUser: Int
    var downloads: Int
    var uploadsRemaining: Int
    var instagramUsername: String
    var email: String
    var selfLink: String
    var htmlLink: String
    var photosLink: String
    var likesLink: String
    var portfolioLink: String
    
    enum UserKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioUrl = "portfolio_url"
        case bio
        case location
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case totalCollections = "total_collections"
        case followedByUser = "followed_by_user"
        case downloads
        case uploadsRemaining = "uploads_remaining"
        case instagramUsername = "instagram_username"
        case email
        case selfLink = "self"
        case htmlLink = "html"
        case photosLink = "photos"
        case likesLink = "likes"
        case portfolioLink = "portfolio"
    }
}

extension User: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserKeys.self)
        id = try container.decode(String.self, forKey: .id)
        updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        username = try container.decode(String.self, forKey: .username)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        twitterUsername = try container.decode(String.self, forKey: .twitterUsername)
        portfolioUrl = try container.decode(String.self, forKey: .portfolioUrl)
        bio = try container.decode(String.self, forKey: .bio)
        location = try container.decode(String.self, forKey: .location)
        totalLikes = try container.decode(Int.self, forKey: .totalLikes)
        totalPhotos = try container.decode(Int.self, forKey: .totalPhotos)
        totalCollections = try container.decode(Int.self, forKey: .totalCollections)
        followedByUser = try container.decode(Int.self, forKey: .followedByUser)
        downloads = try container.decode(Int.self, forKey: .downloads)
        uploadsRemaining = try container.decode(Int.self, forKey: .uploadsRemaining)
        instagramUsername = try container.decode(String.self, forKey: .instagramUsername)
        email = try container.decode(String.self, forKey: .email)
        selfLink = try container.decode(String.self, forKey: .selfLink)
        htmlLink = try container.decode(String.self, forKey: .htmlLink)
        photosLink = try container.decode(String.self, forKey: .photosLink)
        likesLink = try container.decode(String.self, forKey: .likesLink)
        portfolioLink = try container.decode(String.self, forKey: .portfolioLink)
    }
}

//{
//    "id": "pXhwzz1JtQU",
//    "updated_at": "2016-07-10T11:00:01-05:00",
//    "username": "jimmyexample",
//    "first_name": "James",
//    "last_name": "Example",
//    "twitter_username": "jimmy",
//    "portfolio_url": null,
//    "bio": "The user's bio",
//    "location": "Montreal, Qc",
//    "total_likes": 20,
//    "total_photos": 10,
//    "total_collections": 5,
//    "followed_by_user": false,
//    "downloads": 4321,
//    "uploads_remaining": 4,
//    "instagram_username": "james-example",
//    "location": null,
//    "email": "jim@example.com",
//    "links": {
//        "self": "https://api.unsplash.com/users/jimmyexample",
//        "html": "https://unsplash.com/jimmyexample",
//        "photos": "https://api.unsplash.com/users/jimmyexample/photos",
//        "likes": "https://api.unsplash.com/users/jimmyexample/likes",
//        "portfolio": "https://api.unsplash.com/users/jimmyexample/portfolio"
//    }
//}
