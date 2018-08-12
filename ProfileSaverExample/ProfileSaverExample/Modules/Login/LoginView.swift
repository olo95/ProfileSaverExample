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
    
    let userScrollView: UIScrollView = {
       return UIScrollView()
    }()
    
    let userView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorTheme.surface.value
        view.layer.cornerRadius = 8
        view.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        view.layer.shadowRadius = 3.0
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let userStackView: UIStackView = {
       let stackView = UIStackView(frame: .zero)
        return stackView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let usernameValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let firstNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let firstNameValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let lastNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let lastNameValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let twitterUsernameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let twitterUsernameValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let portfolioUrlLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let portfolioUrlValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let bioLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let bioValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let locationValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let totalLikesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let totalLikesValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let totalPhotosLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let totalPhotosValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let totalCollectionsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let totalCollectionsValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let followedByUserLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let followedByUserValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let downloadsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let downloadsValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let uploadsRemainingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let uploadsRemainingValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let instagramUsernameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let instagramUsernameValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let emailValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let selfLinkLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let selfLinkValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let htmlLinkLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let htmlLinkValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let photosLinkLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let photosLinkValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let likesLinkLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let likesLinkValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let portfolioLinkLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let portfolioLinkValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = ColorTheme.background.value
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addNoUserLoggedView() {
        setNoUserLoadedView()
    }
    
    private func setNoUserLoadedView() {
        
        userView.removeFromSuperview()
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
    
    func addUserView(with user: User) {
        setUserLabels(with: user)
        setUserView()
    }
    
    private func setUserLabels(with user: User) {
        usernameValueLabel.text = user.username
        firstNameValueLabel.text = user.firstName
        lastNameValueLabel.text = user.lastName
        twitterUsernameValueLabel.text = user.twitterUsername
        portfolioUrlValueLabel.text = user.portfolioUrl
        bioValueLabel.text = user.bio
        locationValueLabel.text = user.location
        totalLikesValueLabel.text = String(user.totalLikes ?? 0)
        totalPhotosValueLabel.text = String(user.totalPhotos ?? 0)
        totalCollectionsValueLabel.text = String(user.totalCollections ?? 0)
        followedByUserValueLabel.text = user.followedByUser ? "YES" : "NO"
        downloadsValueLabel.text = String(user.downloads ?? 0)
        uploadsRemainingValueLabel.text = String(user.uploadsRemaining ?? 0)
        instagramUsernameValueLabel.text = user.instagramUsername
        emailValueLabel.text = user.email
        selfLinkValueLabel.text = user.selfLink
        htmlLinkValueLabel.text = user.htmlLink
        photosLinkValueLabel.text = user.photosLink
        likesLinkValueLabel.text = user.likesLink
        portfolioLinkValueLabel.text = user.portfolioLink
    }
    
    private func setUserView() {
        noUserLoadedView.removeFromSuperview()
        addSubview(userScrollView)
        userScrollView.addSubview(userView)
        userView.addSubview(userStackView)
        
        userScrollView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        
        userView.snp.makeConstraints { make in
            make.edges.equalTo(0)
            make.width.equalTo(self)
            make.height.equalTo(self).priority(100)
        }
        
        userStackView.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.bottom.equalTo(-8)
        }
        
        userStackView.addArrangedSubview(usernameLabel)
        userStackView.addArrangedSubview(usernameValueLabel)
        userStackView.addArrangedSubview(firstNameLabel)
        userStackView.addArrangedSubview(firstNameValueLabel)
        userStackView.addArrangedSubview(lastNameLabel)
        userStackView.addArrangedSubview(lastNameValueLabel)
        userStackView.addArrangedSubview(twitterUsernameLabel)
        userStackView.addArrangedSubview(twitterUsernameValueLabel)
        userStackView.addArrangedSubview(portfolioUrlLabel)
        userStackView.addArrangedSubview(portfolioUrlValueLabel)
        userStackView.addArrangedSubview(bioLabel)
        userStackView.addArrangedSubview(bioValueLabel)
        userStackView.addArrangedSubview(locationLabel)
        userStackView.addArrangedSubview(locationValueLabel)
        userStackView.addArrangedSubview(totalLikesLabel)
        userStackView.addArrangedSubview(totalLikesValueLabel)
        userStackView.addArrangedSubview(totalPhotosLabel)
        userStackView.addArrangedSubview(totalPhotosValueLabel)
        userStackView.addArrangedSubview(totalCollectionsLabel)
        userStackView.addArrangedSubview(totalCollectionsValueLabel)
        userStackView.addArrangedSubview(followedByUserLabel)
        userStackView.addArrangedSubview(followedByUserValueLabel)
        userStackView.addArrangedSubview(downloadsLabel)
        userStackView.addArrangedSubview(downloadsValueLabel)
        userStackView.addArrangedSubview(uploadsRemainingLabel)
        userStackView.addArrangedSubview(uploadsRemainingValueLabel)
        userStackView.addArrangedSubview(instagramUsernameLabel)
        userStackView.addArrangedSubview(instagramUsernameValueLabel)
        userStackView.addArrangedSubview(emailLabel)
        userStackView.addArrangedSubview(emailValueLabel)
        userStackView.addArrangedSubview(selfLinkLabel)
        userStackView.addArrangedSubview(selfLinkValueLabel)
        userStackView.addArrangedSubview(htmlLinkLabel)
        userStackView.addArrangedSubview(htmlLinkValueLabel)
        userStackView.addArrangedSubview(photosLinkLabel)
        userStackView.addArrangedSubview(photosLinkValueLabel)
        userStackView.addArrangedSubview(likesLinkLabel)
        userStackView.addArrangedSubview(likesLinkValueLabel)
        userStackView.addArrangedSubview(portfolioLinkLabel)
        userStackView.addArrangedSubview(portfolioLinkValueLabel)
    }
}
