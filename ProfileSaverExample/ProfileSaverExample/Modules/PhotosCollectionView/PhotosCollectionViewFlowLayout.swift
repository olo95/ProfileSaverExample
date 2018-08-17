//
//  PhotosCollectionViewFlowLayout.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 16/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class PhotosCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    init(itemSize: CGSize) {
        super.init()
        self.itemSize = itemSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
