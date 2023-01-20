//
//  HomeController.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 05/01/2023.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    
    
    // MARK: - IBOutlets & IBActions
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statutLabel: UILabel!
    @IBOutlet weak var profilImageView: UIImageView!
    
    @IBOutlet weak var infoCollectionView: UICollectionView!
    
    
    @IBAction func profilButton(_ sender: UIButton) {
        print("Test button OK")
    }
    

    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilImageView.makeRounded()

        let nibName = UINib(nibName: "InfoViewCell", bundle: nil)
        infoCollectionView.register(nibName, forCellWithReuseIdentifier: "infoCell")
        
        
    }
    
    // MARK: - Methods
    
    
    
}

// MARK: Extensions

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath)
        return infoCell
    }
    

}
