//
//  CircularImageView.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 03/01/2023.
//

import UIKit

extension UIImageView {
    
    func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
    
}
