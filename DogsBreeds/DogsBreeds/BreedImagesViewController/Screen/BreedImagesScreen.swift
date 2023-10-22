//
//  BreedsImageScreen.swift
//  DogsBreeds
//
//  Created by mcor on 14/10/23.
//

import UIKit

class BreedImagesScreen: UIView {
        
        lazy var collectionView: UICollectionView = {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
//            layout.minimumInteritemSpacing = 16
//            layout.minimumLineSpacing = 16
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.showsVerticalScrollIndicator = false
            cv.register(BreedImagesCollectionViewCell.self, forCellWithReuseIdentifier: BreedImagesCollectionViewCell.identifier)
            return cv
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .white
            addSubview(collectionView)
            configureConstraits()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configureConstraits() {
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
                collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
            
        }
        
        public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, datasource: UICollectionViewDataSource) {
            collectionView.delegate = delegate
            collectionView.dataSource = datasource
        }
        

    }



