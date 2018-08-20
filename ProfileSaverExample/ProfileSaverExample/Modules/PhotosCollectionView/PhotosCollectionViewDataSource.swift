//
//  CollectionViewDataSource.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 16/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class PhotosCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var data: [(id: String?, imageUrl: URL)]
    
    init(data: [(id: String?, imageUrl: URL)]) {
        self.data = data
        super.init()
    }
    
    func getImageId(from indexPath: IndexPath) -> String? {
        return data[indexPath.row].id
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(with: data[indexPath.row].id, imageUrl: data[indexPath.row].imageUrl)
        return cell
    }
}
