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
    
    let scrollView = UIScrollView()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.background.value
        return UIView()
    }()
    
    let photoSearchQueryTextField: MDCTextField = {
        return MDCTextField(frame: .zero)
    }()
    
    lazy var photoSearchQueryTextInputController = MDCTextInputControllerOutlined(textInput: photoSearchQueryTextField)
    
    let photoSearchQueryButton: MDCButton = {
        let button = MDCButton()
        button.setTitle("SEARCH", for: .normal)
        return button
    }()
    
    let randomPhotosContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.onBackground.value
        view.layer.cornerRadius = 8
        view.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        view.layer.shadowRadius = 3.0
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let randomPhotosTitleLabel: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    let randomPhotosCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        initTextInputControllers()
        setLayout()
        backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initTextInputControllers() {
        photoSearchQueryTextInputController.placeholderText = "Type tags"
    }
    
    private func setLayout() {
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
    }
}
