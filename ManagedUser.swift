//
//  User+CoreDataClass.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 07/02/2023.
//
//

import Foundation
import CoreData

final class ManagedUser: NSManagedObject {
    
    @NSManaged public var name: String?
    @NSManaged public var isAdmin: Bool
    @NSManaged public var pass: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var id: String?
}

extension ManagedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedUser> {
        return NSFetchRequest<ManagedUser>(entityName: "ManagedUser")
    }
}


