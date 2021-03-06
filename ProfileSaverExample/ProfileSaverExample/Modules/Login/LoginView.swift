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
    
    let noUserLoggedView = NoUserLoggedView()
    
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
    
    var userStackView: UIStackView!
    
    private func getNewStackView() -> UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }
    
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
        noUserLoggedView.removeFromSuperview()
        addSubview(noUserLoggedView)
        
        noUserLoggedView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.right.equalTo(-8)
            make.left.equalTo(8)
        }
    }
    
    func addUserView(with user: User) {
        setUserView(with: user)
    }
    
    private func setUserView(with user: User) {
        userStackView = getNewStackView()
        noUserLoggedView.removeFromSuperview()
        userScrollView.removeFromSuperview()
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
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Username"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.username))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "First name"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.firstName))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Last name"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.lastName))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Twitter username"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.twitterUsername ?? "---"))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Portfolio url"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.portfolioUrl ?? "---"))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Bio"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.bio ?? "---"))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Location"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.location ?? "---"))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Total likes"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: String(user.totalLikes ?? 0)))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Total photos"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: String(user.totalPhotos ?? 0)))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Total collections"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: String(user.totalCollections ?? 0)))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Followed by user"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: (user.followedByUser ?? false) ? "YES" : "NO"))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Downloads"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: String(user.downloads ?? 0)))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Uploads remaining"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: String(user.uploadsRemaining ?? 0)))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Instagram username"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.instagramUsername ?? "---"))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Email"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.email ?? "---"))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Self link"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.selfLink ?? "---"))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "HTML link"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.htmlLink ?? "---"))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Photos link"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.photosLink ?? "---"))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Likes link"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.likesLink ?? "---"))
        
        userStackView.addArrangedSubview(UILabel.createTitleLabel(with: "Portfolio link"))
        userStackView.addArrangedSubview(UILabel.createValueLabel(with: user.portfolioLink ?? "---"))
    }
}

fileprivate extension UILabel {
    static func createTitleLabel(with string: String?) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = string
        label.textColor = ColorTheme.secondary.value
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.numberOfLines = 0
        return label
    }
    
    static func createValueLabel(with string: String?) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = string
        label.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.thin)
        label.numberOfLines = 0
        return label
    }
}
