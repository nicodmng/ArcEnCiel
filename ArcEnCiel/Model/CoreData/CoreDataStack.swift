//
//  CoreDataStack.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 26/01/2023.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    // MARK: - Properties
    
    private let modelName: String
    
    // MARK: - Initializer
    
    public init(modelName: String) {
        self.modelName = modelName
    }
    
    // MARK: - Core Data stack
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Erreur non résolue \(error), \(error.userInfo) for: \(storeDescription.description)")
            }
        }
        return container
    }()
    
    public lazy var mainContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    public func saveContext() {
        guard mainContext.hasChanges else { return }
        do {
            try mainContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.description)")
        }
    }
    
}
