//
//  AddEventController.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 04/01/2023.
//

import Foundation
import UIKit

class AddEventController: UIViewController {
    
    // MARK: - Properties
    
    
    
    // MARK: - IBOutlets & IBActions
    
    @IBOutlet weak var descriptionEventTextField: UITextField!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var commentsTextVIew: UITextView!
    @IBOutlet var teamsButton: [UIButton]!
    
    @IBAction func tappedTeamButton(_ sender: Any) {
        guard let teamsButton = sender as? UIButton else {
            return
        }
        
        switch teamsButton.tag {
        case 0 :
            teamsButton.layer.borderWidth = 2
            teamsButton.cornerRadius = 20
            teamsButton.layer.borderColor = UIColor.green.cgColor
            
        case 1 :
            teamsButton.layer.borderWidth = 2
            teamsButton.cornerRadius = 20
            teamsButton.layer.borderColor = UIColor.green.cgColor
            
        case 2 :
            teamsButton.layer.borderWidth = 2
            teamsButton.cornerRadius = 20
            teamsButton.layer.borderColor = UIColor.green.cgColor
            
        case 3 :
            teamsButton.layer.borderWidth = 2
            teamsButton.cornerRadius = 20
            teamsButton.layer.borderColor = UIColor.green.cgColor
            
        case 4 :
            teamsButton.layer.borderWidth = 2
            teamsButton.cornerRadius = 20
            teamsButton.layer.borderColor = UIColor.green.cgColor
            
        case 5 :
            teamsButton.layer.borderWidth = 2
            teamsButton.cornerRadius = 20
            teamsButton.layer.borderColor = UIColor.green.cgColor
        default :
            return
            
        }
    }
    
    
    @IBAction func recurrenceButton(_ sender: UIButton) {
        
    }
    
    @IBAction func validateButton(_ sender: Any) {
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        
    }
    
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    
}
