//
//  LogInViewController.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 13/12/2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {

    // MARK: - Properties
    
    
    // MARK: - IBOutlets & IBActions
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func connexionButtonPressed(_ sender: Any) {
        print("Bouton Se Connecter OK")
    }
    
    // MARK: - Functions
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
