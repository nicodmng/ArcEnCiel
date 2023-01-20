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
    @IBOutlet weak var nextEventCollectionView: UICollectionView!
    
    @IBAction func profilButton(_ sender: UIButton) {
        print("Test button OK")
    }
    
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilImageView.makeRounded()
        
        let nibName = UINib(nibName: "InfoViewCell", bundle: nil)
        infoCollectionView.register(nibName, forCellWithReuseIdentifier: "infoCell")
        
        let nibName2 = UINib(nibName: "NextEventViewCell", bundle: nil)
        nextEventCollectionView.register(nibName2, forCellWithReuseIdentifier: "nextEventCell")
    }
    
    // MARK: - Methods
    
    
    
}

// MARK: Extensions

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == infoCollectionView {
            return 10
        } else if collectionView == nextEventCollectionView {
            return 5
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.infoCollectionView {
            let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath)
            return infoCell
        } else if collectionView == self.nextEventCollectionView {
            let nextEventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "nextEventCell", for: indexPath)
            return nextEventCell
        }
        return UICollectionViewCell()
    }
    
    
}
