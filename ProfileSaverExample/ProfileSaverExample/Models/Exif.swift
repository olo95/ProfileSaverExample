//
//  Exif.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 14/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

struct Exif {
    var make: String
    var model: String
    var exposureTime: String
    var aperture: String
    var focalLength: String
    var iso: Int
    
    enum ExifKeys: String, CodingKey {
        case make
        case model
        case exposureTime = "exposure_time"
        case aperture
        case focalLength = "focal_length"
        case iso
    }
}

extension Exif: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ExifKeys.self)
        make = try container.decode(String.self, forKey: .make)
        model = try container.decode(String.self, forKey: .model)
        exposureTime = try container.decode(String.self, forKey: .exposureTime)
        aperture = try container.decode(String.self, forKey: .aperture)
        focalLength = try container.decode(String.self, forKey: .focalLength)
        iso = try container.decode(Int.self, forKey: .iso)
    }
}
