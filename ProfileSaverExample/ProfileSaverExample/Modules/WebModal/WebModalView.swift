//
//  WebModalView.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 05/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import SnapKit
import WebKit

class WebModalView: UIView {
    
    var rootContainerTopConstraint: Constraint?
    var rootContainerBottomConstraint: Constraint?
    
    let dismissIndicatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorTheme.onPrimary.value
        view.layer.cornerRadius = 2
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.layer.shadowRadius = 2.0
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    let dismissView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }()
    
    let webView: WKWebView = {
       return WKWebView()
    }()
    
    let rootContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorTheme.onSecondary.value.withAlphaComponent(0.95)
        view.layer.cornerRadius = 8
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.layer.shadowRadius = 2.0
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        isOpaque = false
        setRootContainer()
        setDismissView()
        setDismissIndicatorView()
        setWebView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setRootContainer() {
        addSubview(rootContainer)
        rootContainer.snp.removeConstraints()
        rootContainer.snp.makeConstraints { make in
            rootContainerTopConstraint = make.top.equalTo(64).constraint
            rootContainerBottomConstraint = make.bottom.equalTo(0).constraint
            make.right.equalTo(snp.right).offset(-8)
            make.left.equalTo(snp.left).offset(8)
        }
    }
    
    private func setDismissView() {
        rootContainer.addSubview(dismissView)
        dismissView.snp.removeConstraints()
        dismissView.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.top.equalTo(8)
            make.left.equalTo(rootContainer.snp.left).offset(16)
            make.right.equalTo(rootContainer.snp.right).offset(-16)
        }
    }
    
    private func setDismissIndicatorView() {
        dismissView.addSubview(dismissIndicatorView)
        dismissIndicatorView.snp.removeConstraints()
        dismissIndicatorView.snp.makeConstraints { make in
            make.height.equalTo(8)
            make.top.equalTo(8)
            make.left.equalTo(rootContainer.snp.left).offset(16)
            make.right.equalTo(rootContainer.snp.right).offset(-16)
        }
    }
    
    private func setWebView() {
        rootContainer.addSubview(webView)
        webView.snp.removeConstraints()
        webView.snp.makeConstraints { make in
            make.bottom.equalTo(0)
            make.right.left.equalTo(0)
            make.top.equalTo(dismissView.snp.bottom)
        }
    }
}
