//
//  ListViewController.swift
//  DogsBreeds
//
//  Created by mcor on 10/10/23.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var breedsTableView: UITableView!
    
    var breeds: [String] = []
//    let breedImagesVC: BreedImagesViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        
        API().getBreedsList { [weak self] breeds, error in
                   if let breeds = breeds {
                       self?.breeds = breeds
                       DispatchQueue.main.async {
                           self?.breedsTableView.reloadData()
                       }
                   } else if let error = error {
                       print("Ocorreu um erro: \(error.localizedDescription)")
                   }
               }
    }
    
    func configureTableView() {
        breedsTableView.delegate = self
        breedsTableView.dataSource = self
        breedsTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }


}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.setup(title: breeds[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBreed = breeds[indexPath.row] // Raça selecionada
        let breedImagesVC = BreedImagesViewController(breed: selectedBreed)
        navigationController?.pushViewController(breedImagesVC, animated: true)
    }

    
    
}
