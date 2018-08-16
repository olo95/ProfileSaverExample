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
    var imageUrl: URL?
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        setLayout()
    }
    
    func configureCell(with imageId: String, imageUrl: URL) {
        self.imageId = imageId
        self.imageUrl = imageUrl
    }
    
    func downloadImage(with url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let `self` = self, error == nil, let data = data, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                UIViewPropertyAnimator(duration: 1.0, dampingRatio: 1.0, animations: {
                    self.imageView.image = image
                }).startAnimation()
            }
        }
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
