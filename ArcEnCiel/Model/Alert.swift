//
//  Alert.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 13/01/2023.
//

import Foundation

struct Alert {
    
    var id: String
    var type: String
    var team: String?
    var title: String
    var message: String?
    var priority: Int
    var endDate: Date?
}
