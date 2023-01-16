//
//  SettingsController.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 05/01/2023.
//

import Foundation
import UIKit

class SettingsController: UIViewController {
    
    // MARK: - Properties
    
    
    
    // MARK: - IBOutlets & IBActions
    
    @IBOutlet weak var profilImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBAction func editProfilImageButton(_ sender: UIButton) {
        print("Edit Image button OK")
    }
    
    @IBAction func contactACEButton(_ sender: UIButton) {
        print("Contact ACE button OK")
    }
    
    @IBAction func contactSupportButton(_ sender: UIButton) {
        print("Contact support button OK")
    }
    
    @IBAction func disconnectButton(_ sender: UIButton) {
        print("Deconnexion button OK")
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilImageView.makeRounded()
    }
    
    
    // MARK: - Methods
    
    
}
