//
//  WebModalView.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 05/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import SnapKit

class WebModalView: UIView {
    
    var rootContainerTopConstraint: Constraint?
    
    let dismissIndicatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorTheme.onPrimary.value
        view.layer.cornerRadius = 2
        return view
    }()
    
    let rootContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorTheme.onSecondary.value.withAlphaComponent(0.95)
        view.layer.cornerRadius = 8
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        setRootContainer()
        setDismissIndicatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setRootContainer() {
        addSubview(rootContainer)
        rootContainer.snp.removeConstraints()
        rootContainer.snp.makeConstraints { make in
            rootContainerTopConstraint = make.top.equalTo(64).constraint
            make.bottom.equalTo(0)
            make.right.equalTo(snp.right).offset(-8)
            make.left.equalTo(snp.left).offset(8)
        }
    }
    
    private func setDismissIndicatorView() {
        rootContainer.addSubview(dismissIndicatorView)
        dismissIndicatorView.snp.removeConstraints()
        dismissIndicatorView.snp.makeConstraints { make in
            make.height.equalTo(8)
            make.top.equalTo(8)
            make.left.equalTo(rootContainer.snp.left).offset(16)
            make.right.equalTo(rootContainer.snp.right).offset(-16)
        }
    }
}