//
//  Location.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 14/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct Location {
    var city: String
    var country: String
    var latitude: Double
    var longitude: Double
    
    enum LocationKeys: String, CodingKey {
        case city
        case country
        case latitude
        case longitude
    }
}

extension Location: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LocationKeys.self)
        city = try container.decode(String.self, forKey: .city)
        country = try container.decode(String.self, forKey: .country)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
    }
}
