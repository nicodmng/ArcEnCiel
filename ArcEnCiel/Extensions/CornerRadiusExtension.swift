//
//  CornerRadiusExtension.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 05/01/2023.
//

import Foundation
import UIKit

extension UIView {
    
// Add corner radius parameter
  @IBInspectable var cornerRadius: CGFloat {
   get{
        return layer.cornerRadius
    }
    set {
        layer.cornerRadius = newValue
        layer.masksToBounds = newValue > 0
    }
  }
    
}
