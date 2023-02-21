//
//  DetailEventController.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 09/01/2023.
//

import Foundation
import UIKit

class DetailEventController: UIViewController {
    
    // MARK: - Properties
    
    var imageProfil: [String] = ["portrait", "portrait_2", "portrait_3"]
    
    // MARK: - IBOutlets & IBActions
    
    
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension DetailEventController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageProfil.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! CollectionViewCell
        cell.imageProfilImage.image = UIImage(named: imageProfil[indexPath.row])
        return cell
    }
    
    
}
