//
//  LoginView.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import SnapKit

class LoginView: UIView {
    
    let noUserLoadedView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorTheme.surface.value
        view.layer.cornerRadius = 8
        view.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        view.layer.shadowRadius = 3.0
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let noUserLoadedLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "No user loaded"
        label.textAlignment = .center
        return label
    }()
    
    let noUserLoadedImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "user"))
        imageView.tintColor = ColorTheme.onBackground.value
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.yellow
        setNoUserLoadedView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setNoUserLoadedView() {
        
        addSubview(noUserLoadedView)
        noUserLoadedView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.right.equalTo(-8)
            make.left.equalTo(8)
        }
        
        noUserLoadedView.addSubview(noUserLoadedLabel)
        noUserLoadedLabel.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.bottom.equalTo(-16)
        }
        
        noUserLoadedView.addSubview(noUserLoadedImageView)
        noUserLoadedImageView.snp.makeConstraints { make in
            make.bottom.equalTo(noUserLoadedLabel.snp.top).offset(-8)
            make.center.equalToSuperview()
            make.top.greaterThanOrEqualTo(8)
            make.height.equalTo(64)
            make.width.equalTo(64)
        }
    }
}
