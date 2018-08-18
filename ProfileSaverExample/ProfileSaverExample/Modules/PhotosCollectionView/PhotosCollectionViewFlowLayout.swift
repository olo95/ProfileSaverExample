//
//  PhotosCollectionViewFlowLayout.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 16/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class PhotosCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private let numberOfColumns = 3
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        return collectionView.bounds.width
    }
    
    private var contentHeight: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        return collectionView.contentSize.height
    }
    
    override init() {
        super.init()
        minimumLineSpacing = 0.0
        minimumInteritemSpacing = 0.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var collectionViewContentSize: CGSize {
        itemSize.width = contentWidth / 3
        itemSize.height = itemSize.width
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let layoutAtributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        layoutAtributes.frame.size.width = contentWidth / 3
        return layoutAtributes
    }
}
