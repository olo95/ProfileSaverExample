//
//  SearchView.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import SnapKit
import MaterialComponents.MaterialTextFields

class SearchView: UIView {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = ColorTheme.surface.value
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.surface.value
        return view
    }()
    
    let noUserLoggedView = NoUserLoggedView()
    
    let photoSearchQueryTextField: MDCTextField = {
        return MDCTextField(frame: .zero)
    }()
    
    lazy var photoSearchQueryTextInputController = MDCTextInputControllerOutlined(textInput: photoSearchQueryTextField)
    
    let photoSearchQueryButton: MDCButton = {
        let button = MDCButton()
        button.backgroundColor = ColorTheme.secondary.value
        button.layer.cornerRadius = 8
        button.setTitle("SEARCH", for: .normal)
        button.setTitleColor(ColorTheme.surface.value, for: .normal)
        return button
    }()
    
    let randomPhotosContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.primaryVariant.value
        view.layer.cornerRadius = 8
        view.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        view.layer.shadowRadius = 3.0
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let randomPhotosTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "RANDOM PHOTOS"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    private var randomPhotosCollectionViewHeightConstraint: Constraint?
    
    let randomPhotosCollectionView: UICollectionView = {
        let collectionViewFlowLayout = PhotosCollectionViewFlowLayout(itemSize: CGSize(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 3))
        let collectionView = PhotosCollectionView(collectionViewFlowLayout: collectionViewFlowLayout)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = ColorTheme.primaryVariant.value
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = ColorTheme.background.value
        initTextInputControllers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initTextInputControllers() {
        photoSearchQueryTextInputController.placeholderText = "Type tags"
        photoSearchQueryTextInputController.activeColor = ColorTheme.secondary.value
        photoSearchQueryTextInputController.normalColor = ColorTheme.secondaryVariant.value
    }
    
    func setMainLayout() {
        addSubviews()
        setContentView()
    }
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(photoSearchQueryTextField)
        contentView.addSubview(photoSearchQueryButton)
        contentView.addSubview(randomPhotosContainerView)
        randomPhotosContainerView.addSubview(randomPhotosTitleLabel)
        randomPhotosContainerView.addSubview(randomPhotosCollectionView)
    }
    
    private func setContentView() {
        noUserLoggedView.removeFromSuperview()
        scrollView.removeFromSuperview()
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(photoSearchQueryTextField)
        contentView.addSubview(photoSearchQueryButton)
        contentView.addSubview(randomPhotosContainerView)
        randomPhotosContainerView.addSubview(randomPhotosTitleLabel)
        randomPhotosContainerView.addSubview(randomPhotosCollectionView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(0)
            make.width.equalTo(self)
            make.height.equalTo(self).priority(100)
        }
        
        photoSearchQueryTextField.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.bottom.equalTo(photoSearchQueryButton.snp.top).offset(-8)
        }
        
        photoSearchQueryButton.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.right.equalTo(-8)
        }
        
        randomPhotosContainerView.snp.makeConstraints { make in
            make.top.equalTo(photoSearchQueryButton.snp.bottom).offset(16)
            make.right.equalTo(-8)
            make.left.equalTo(8)
            make.bottom.equalTo(-16)
        }
        
        randomPhotosTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.right.equalTo(-8)
            make.left.equalTo(8)
        }
        
        randomPhotosCollectionView.snp.makeConstraints { make in
            make.top.equalTo(randomPhotosTitleLabel.snp.bottom).offset(8)
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.bottom.equalTo(-8)
            randomPhotosCollectionViewHeightConstraint = make.height.equalTo(1).priority(999).constraint
        }
    }
    
    func addNoUserLoggedView() {
        setNoUserLoadedView()
    }
    
    private func setNoUserLoadedView() {
        
        scrollView.removeFromSuperview()
        noUserLoggedView.removeFromSuperview()
        addSubview(noUserLoggedView)
        
        noUserLoggedView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.right.equalTo(-8)
            make.left.equalTo(8)
        }
    }
    
    func validateRandomPhotosCollectionViewHeight() {
        randomPhotosCollectionViewHeightConstraint?.layoutConstraints.first?.constant =  randomPhotosCollectionView.collectionViewLayout.collectionViewContentSize.height
        layoutIfNeeded()
    }
}
