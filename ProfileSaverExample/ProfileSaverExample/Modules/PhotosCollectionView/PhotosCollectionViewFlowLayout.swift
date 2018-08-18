//
//  PhotosCollectionViewFlowLayout.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 16/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol PhotosCollectionViewFlowLayoutDelegate: class {
    func validateRandomPhotosCollectionViewHeight()
}

class PhotosCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var delegate: PhotosCollectionViewFlowLayoutDelegate?
    private let numberOfColumns: CGFloat = 3.0
    
    override init() {
        super.init()
        minimumLineSpacing = 0.0
        minimumInteritemSpacing = 0.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        let contentWidth = collectionView?.bounds.width ?? 0.0
        self.itemSize.width = (contentWidth / self.numberOfColumns).rounded(.down)
        self.itemSize.height = self.itemSize.width.rounded(.down)
        delegate?.validateRandomPhotosCollectionViewHeight()
    }
}
