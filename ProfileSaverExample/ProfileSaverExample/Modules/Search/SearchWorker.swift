//
//  SearchWorker.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

class SearchWorker {
    
    func getRandomPhotos(count: Int, completionHandler: @escaping ([Photo]?) -> ()) {
        NetworkManager.shared.getRandomPhotos(count: count) { photos in
            DispatchQueue.main.async {
                completionHandler(photos)
            }
        }
    }
}
