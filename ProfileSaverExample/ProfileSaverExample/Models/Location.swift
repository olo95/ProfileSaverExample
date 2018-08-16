//
//  Location.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 14/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct Location {
    var city: String?
    var country: String?
    var latitude: Double?
    var longitude: Double?
    
    enum LocationKeys: String, CodingKey {
        case city
        case country
        case position
        case latitude
        case longitude
    }
}

extension Location: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LocationKeys.self)
        city = try container.decodeIfPresent(String.self, forKey: .city)
        country = try container.decodeIfPresent(String.self, forKey: .country)
        let positionContainer = try container.nestedContainer(keyedBy: LocationKeys.self, forKey: .position)
        latitude = try positionContainer.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try positionContainer.decodeIfPresent(Double.self, forKey: .longitude)
    }
}
