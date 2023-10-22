//
//  BreedImagesViewController.swift
//  DogsBreeds
//
//  Created by mcor on 14/10/23.
//

import UIKit

class BreedImagesViewController: UIViewController {
    
    private var breedsImageScreen: BreedImagesScreen?
    
    override func loadView() {
        breedsImageScreen = BreedImagesScreen()
        view = breedsImageScreen
    }
    
    var images: [String] = []
    
    let breed: String

        init(breed: String) {
            self.breed = breed
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = breed
        fetchImages()
        breedsImageScreen?.configProtocolsCollectionView(delegate: self, datasource: self)

        
    }
    func fetchImages() {
           BreedImagesAPI().getImages(for: breed) { [weak self] images, error in
               if let images = images {
                   self?.images = images
                   DispatchQueue.main.async {
                       self?.breedsImageScreen?.collectionView.reloadData()
                   }
               } else if let error = error {
                   print("Error fetching images: \(error.localizedDescription)")
               }
           }
       }
   
   
}

extension BreedImagesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BreedImagesCollectionViewCell.identifier, for: indexPath) as? BreedImagesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let imageUrlString = images[indexPath.item]
            if let imageUrl = URL(string: imageUrlString) {
                cell.setup(imageUrl: imageUrl)
            }
        return cell

    }

    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let width = (collectionView.bounds.width - 48) // 16 pontos de espaçamento de cada lado
//           let height: CGFloat = 190 // ou o valor que você desejar
//           return CGSize(width: width, height: height)
//    }
    
    
}
