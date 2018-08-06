//
//  WebModalView.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 05/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import SnapKit

class WebModalView: UIView {
    
    let rootContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorTheme.onPrimary.value
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        setRootContainer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setRootContainer() {
        addSubview(rootContainer)
        rootContainer.snp.removeConstraints()
        rootContainer.snp.makeConstraints { make in
            make.top.equalTo(32)
            make.bottom.equalTo(0)
            make.right.equalTo(8)
            make.left.equalTo(8)
        }
    }
}
