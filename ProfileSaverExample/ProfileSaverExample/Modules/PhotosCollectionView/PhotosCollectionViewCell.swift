//
//  PhotosCollectionViewCell.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 16/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit
import SnapKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PhotosCollectionViewCell"
    
    var imageId: String?
    var image: UIImage?
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: image)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        setLayout()
    }
    
    func configureCell(with imageId: String, image: UIImage) {
        self.imageId = imageId
        self.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
}
