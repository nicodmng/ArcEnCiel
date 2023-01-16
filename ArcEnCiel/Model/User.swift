//
//  User.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 03/01/2023.
//

import Foundation

struct User {
    
    var id: String
    var imageUrl: String
    var isAdmin: Bool
    var name: String
    var pass: String
    var teams: [Int: String]
}
