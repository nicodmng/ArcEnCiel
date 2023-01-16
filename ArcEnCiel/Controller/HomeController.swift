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
        
        
    }
    
    // MARK: - Methods
    
    
    
}
