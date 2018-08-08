//
//  WebModalViewController.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 05/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit
import WebKit

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
        setupWebView()
        loadAuthorizationPage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDismissIndicatorGesture() {
        mainView.dismissView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dismissIndicatorViewPanned)))
    }
    
    @objc private func dismissIndicatorViewPanned(gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: mainView)
        switch gestureRecognizer.state {
        case .changed:
            mainView.rootContainerTopConstraint?.layoutConstraints.first?.constant = 64 + translation.y
            mainView.rootContainerBottomConstraint?.layoutConstraints.first?.constant = 0 + translation.y
            mainView.layoutIfNeeded()
        case .ended:
            guard let topConstraintConstant = mainView.rootContainerTopConstraint?.layoutConstraints.first?.constant,
                topConstraintConstant < 200.0 else {
                    self.dismiss(animated: true, completion: nil)
                    return
            }
            mainView.rootContainerBottomConstraint?.layoutConstraints.first?.constant = 0
            mainView.rootContainerTopConstraint?.layoutConstraints.first?.constant = 64
            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                self?.mainView.layoutIfNeeded()
            })
        default:
            return
        }
    }
    
    private func setupWebView() {
        mainView.webView.navigationDelegate = self
    }
    
    private func loadAuthorizationPage() {
        guard let path = NetworkRouter.authorize.path, let url = URL(string: path) else { return }
        let urlRequest = URLRequest(url: url)
        mainView.webView.load(urlRequest)
    }
}

extension WebModalViewController: WKNavigationDelegate {
    
}
