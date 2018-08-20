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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    func configureCell(with imageId: String, imageUrl: URL) {
        self.imageId = imageId
        self.imageUrl = imageUrl
        downloadImage(with: imageUrl)
    }
    
    func downloadImage(with url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let `self` = self, error == nil, let data = data, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self.imageView.alpha = 0.0
                UIViewPropertyAnimator(duration: 1.0, dampingRatio: 1.0, animations: {
                    self.imageView.image = image
                    self.imageView.alpha = 1.0
                }).startAnimation()
            }
        }.resume()
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
