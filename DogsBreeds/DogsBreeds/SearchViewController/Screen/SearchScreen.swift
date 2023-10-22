//
//  SearchScreen.swift
//  DogsBreeds
//
//  Created by mcor on 10/10/23.
//

import UIKit
import SnapKit

class SearchScreen: UIView {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Digite a raça"
        return searchBar
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buscar", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(searchBar)
        addSubview(collectionView)
        addSubview(searchButton)
       // configureConstraits()
        configureSearchBarConstraints()
        configureCollectionViewConstraints()
        configureSearchButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func configureConstraits() {
//        NSLayoutConstraint.activate([
//            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 48),
//            searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            searchBar.heightAnchor.constraint(equalToConstant: 48),
            
//            collectionView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 16),
//            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
//            
//            searchButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
//            searchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
//            searchButton.widthAnchor.constraint(equalToConstant: 80),
//            searchButton.heightAnchor.constraint(equalToConstant: 48)
//        ])
        
   // }
    
    private func configureSearchBarConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(48)
            
        }
    }
    
    private func configureSearchButtonConstraints() {
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(80)
        }
    }
    
    private func configureCollectionViewConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, datasource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = datasource
    }
    
    
}
