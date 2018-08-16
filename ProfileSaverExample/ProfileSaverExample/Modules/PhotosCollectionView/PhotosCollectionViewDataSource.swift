//
//  CollectionViewDataSource.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 16/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class PhotosCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var data: [(id: String, image: UIImage)]
    
    init(data: [(id: String, image: UIImage)]) {
        self.data = data
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(with: data[indexPath.row].id, image: data[indexPath.row].image)
        return cell
    }
}
