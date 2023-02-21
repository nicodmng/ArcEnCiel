//
//  CollectionViewCell.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 09/01/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageProfilImage: UIImageView!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var mockData: MockData? {
        didSet {
            
        }
    }

}
