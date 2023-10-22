//
//  CustomTableViewCell.swift
//  DogsBreeds
//
//  Created by mcor on 10/10/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var breedLabel: UILabel!
    
    static let identifier: String = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(title: String) {
        breedLabel.text = title
    }
    
    
}


