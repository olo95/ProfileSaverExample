//
//  LoginView.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import SnapKit
import MaterialComponents.MaterialButtons

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
    
    let noUserLoadedLoginButton: MDCButton = {
        let button = MDCButton(frame: .zero)
        button.setBackgroundColor(ColorTheme.secondary.value)
        button.layer.cornerRadius = 8
        button.setTitle("LOGIN", for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addNoUserLoggedView() {
        setNoUserLoadedView()
    }
    
    private func setNoUserLoadedView() {
        
        addSubview(noUserLoadedView)
        noUserLoadedView.addSubview(noUserLoadedImageView)
        noUserLoadedView.addSubview(noUserLoadedLoginButton)
        noUserLoadedView.addSubview(noUserLoadedLabel)
        
        noUserLoadedView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.right.equalTo(-8)
            make.left.equalTo(8)
        }
        
        noUserLoadedLabel.snp.makeConstraints { make in
            make.right.equalTo(-8)
            make.left.equalTo(noUserLoadedImageView.snp.right).offset(8)
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
            make.right.equalTo(noUserLoadedLabel.snp.left).offset(-16)
            make.centerY.equalTo(noUserLoadedLabel)
            make.bottom.equalTo(noUserLoadedLoginButton.snp.top).offset(-8)
        }
    }
}
