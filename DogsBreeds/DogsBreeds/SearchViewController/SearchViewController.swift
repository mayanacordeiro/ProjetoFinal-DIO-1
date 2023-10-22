//
//  SearchViewController.swift
//  DogsBreeds
//
//  Created by mcor on 10/10/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var searchScreen: SearchScreen?
    
    override func loadView() {
        searchScreen = SearchScreen()
        view = searchScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchScreen?.configProtocolsCollectionView(delegate: self, datasource: self)
        searchScreen?.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    var breedImages: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.searchScreen?.collectionView.reloadData()
            }
        }
    }
    
    @objc func searchButtonTapped() {
        guard var breed = searchScreen?.searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines), !breed.isEmpty else {
            // Tratar o caso em que o campo de texto está vazio
            return
        }
        breed = breed.lowercased()
        
        searchScreen?.searchBar.resignFirstResponder()
        
        SearchBreeds().fetchBreedImages(for: breed) { images, error in
            if let images = images {
                self.breedImages = images
            } else if let error = error {
                print("Error fetching images: \(error.localizedDescription)")
            }
        }
    }
}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return breedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell
        if let imageUrl = URL(string: breedImages[indexPath.item]) {
            cell?.setup(imageUrl: imageUrl)
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.bounds.width - 48) // 16 pontos de espaçamento de cada lado
        let height: CGFloat = 190 // ou o valor que você desejar
        return CGSize(width: width, height: height)
    }
    
}


