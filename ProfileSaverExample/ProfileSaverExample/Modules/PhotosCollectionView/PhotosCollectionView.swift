//
//  PhotosCollectionView.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 16/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit
import class SnapKit.Constraint

class PhotosCollectionView: UICollectionView {
    
    var randomPhotosCollectionViewHeightConstraint: Constraint?
    
    init(collectionViewFlowLayout: UICollectionViewFlowLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
