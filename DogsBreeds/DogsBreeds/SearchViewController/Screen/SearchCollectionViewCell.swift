//
//  SearchCollectionViewCell.swift
//  DogsBreeds
//
//  Created by mcor on 10/10/23.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SearchCollectionViewCell"
    
    lazy var breedsImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 12
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(breedsImageView)
       breedsImageView.pin(to: contentView)
//       configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            breedsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            breedsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            breedsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            breedsImageView.widthAnchor.constraint(equalToConstant: 184),
            breedsImageView.heightAnchor.constraint(equalToConstant: 190)
        
        ])
    }
    
    func setup(imageUrl: URL) {
        breedsImageView.load(url: imageUrl)
    }

    

}

