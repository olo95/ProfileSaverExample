//
//  WebModalViewController.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 05/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class WebModalViewController: UIViewController {
    
    private lazy var rootContainerCenter = mainView.rootContainer.center
    
    private lazy var mainView: WebModalView = {
       return view as! WebModalView
    }()
    
    override func loadView() {
        view = WebModalView()
    }
    
    init(with authorizeUrl: URL) {
        super.init(nibName: nil, bundle: nil)
        setupDismissIndicatorGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDismissIndicatorGesture() {
        mainView.dismissIndicatorView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dismissIndicatorViewPanned)))
    }
    
    @objc private func dismissIndicatorViewPanned(gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: mainView)
        switch gestureRecognizer.state {
        case .began:
            print("began")
        case .changed:
            guard let topConstraintValue = mainView.rootContainerTopConstraint?.layoutConstraints.first?.constant else { return }
            mainView.rootContainer.snp.remakeConstraints { make in
                mainView.rootContainerTopConstraint = make.top.equalTo(topConstraintValue + translation.y).constraint
            }
            mainView.layoutIfNeeded()
        case .ended:
            mainView.rootContainer.snp.remakeConstraints { make in
                mainView.rootContainerTopConstraint = make.top.equalTo(64).constraint
            }
            mainView.layoutIfNeeded()
        default:
            return
        }
    }
}
