//
//  ResponseStatus.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 08/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

enum Response {
    case success(data: Data)
    case failure(description: String)
}
