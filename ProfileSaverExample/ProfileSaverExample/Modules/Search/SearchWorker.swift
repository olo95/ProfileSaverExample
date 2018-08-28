//
//  SearchWorker.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation
import struct UIKit.CGSize

class SearchWorker: AuthorizedWorker {
    
    func getRandomPhotos(count: Int, completionHandler: @escaping ([Photo]?) -> ()) {
        NetworkManager().getRandomPhotos(count: count) { photos in
            DispatchQueue.main.async {
                completionHandler(photos)
            }
        }
    }
    
    func getPhoto(with id: String, completionHandler: @escaping (Photo?) -> ()) {
        NetworkManager().getPhoto(with: id) { photo in
            DispatchQueue.main.async {
                completionHandler(photo)
            }
        }
    }
}
