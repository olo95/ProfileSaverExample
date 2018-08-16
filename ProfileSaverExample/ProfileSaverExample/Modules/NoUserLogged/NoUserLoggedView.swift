//
//  NoUserLoggedView.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 16/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit
import SnapKit
import MaterialComponents.MaterialButtons

class NoUserLoggedView: UIView {
    
    let noUserLoadedLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "No user loaded"
        label.textColor = ColorTheme.secondary.value
        label.textAlignment = .center
        return label
    }()
    
    let noUserLoadedImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "user"))
        imageView.tintColor = ColorTheme.secondary.value
        return imageView
    }()
    
    let noUserLoadedLoginButton: MDCButton = {
        let button = MDCButton(frame: .zero)
        button.setBackgroundColor(ColorTheme.secondary.value)
        button.layer.cornerRadius = 8
        button.setTitle("LOGIN", for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        addSubview(noUserLoadedImageView)
        addSubview(noUserLoadedLoginButton)
        addSubview(noUserLoadedLabel)
        
        noUserLoadedLabel.snp.makeConstraints { make in
            make.right.equalTo(-8)
            make.left.equalTo(noUserLoadedImageView.snp.right).offset(16)
            make.bottom.equalTo(-16)
        }
        
        noUserLoadedLoginButton.snp.makeConstraints { make in
            make.right.equalTo(-8)
            make.left.equalTo(8)
            make.bottom.equalTo(-16)
        }
        
        noUserLoadedImageView.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.top.greaterThanOrEqualTo(16)
            make.height.equalTo(64)
            make.width.equalTo(64)
            make.centerY.equalTo(noUserLoadedLabel)
            make.bottom.equalTo(noUserLoadedLoginButton.snp.top).offset(-8)
        }
    }
}
