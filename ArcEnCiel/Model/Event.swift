//
//  Event.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 03/01/2023.
//

import Foundation

struct Event {
    
    var id: String
    var date: Date
    var hour: String
    var team: String
    var description: String
    var comments: [Int : String]
}
