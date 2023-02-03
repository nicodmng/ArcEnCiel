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
    
    var buttonIsSelected = true

    // MARK: - IBOutlets & IBActions
    
    @IBOutlet weak var descriptionEventTextField: UITextField!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet var teamsButton: [UIButton]!
    
    @IBAction func tappedTeamButton(_ sender: Any) {
        circleGreenButtonApparence(sender: sender)
    }
    

    
    @IBAction func recurrenceButton(_ sender: UIButton) {
        
    }
    
    @IBAction func validateButton(_ sender: Any) {
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    // MARK: - Methods
    
    func circleGreenButtonApparence(sender: Any) {
        guard let teamButton = sender as? UIButton else {
            return
        }
        let selectedButtonTag = teamButton.tag
        for button in teamsButton {
            if (button.tag == selectedButtonTag) {
                changeButtonApparence(teamsButton: button)
            } else {
                reinitialiseButtonApparence(teamsButton: button)
            }
        }
    }
    
    func changeButtonApparence(teamsButton: UIButton) {
        teamsButton.layer.borderWidth = 2
        teamsButton.cornerRadius = 20
        teamsButton.layer.borderColor = UIColor.green.cgColor
    }
    
    func reinitialiseButtonApparence(teamsButton: UIButton) {
        teamsButton.layer.borderWidth = 0
        teamsButton.cornerRadius = 20
    }
    
}
