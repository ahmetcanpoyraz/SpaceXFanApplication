//
//  CoreDataManager.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 12.12.2024.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "SpaceXFanApplication")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
    
    func addRocketToFavorites(_ rocket: RocketModel) {
        let entity = RocketEntity(context: context)
        entity.id = rocket.id
        entity.name = rocket.name
        entity.imageURL = rocket.flickrImages.first
        entity.company = rocket.company
        entity.country = rocket.country
        entity.desciption = rocket.description
        save()
    }
    
    func removeRocketFromFavorites(_ rocket: RocketModel) {
        let fetchRequest: NSFetchRequest<RocketEntity> = RocketEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", rocket.id)
        do {
            let results = try context.fetch(fetchRequest)
            results.forEach { context.delete($0) }
            save()
        } catch {
            print("Failed to fetch or delete rocket: \(error)")
        }
    }
    
    func fetchFavorites() -> [RocketModel] {
        let fetchRequest: NSFetchRequest<RocketEntity> = RocketEntity.fetchRequest()
        do {
            let results = try context.fetch(fetchRequest)
            return results.map {
                RocketModel(flickrImages: [$0.imageURL ?? ""],
                            name: $0.name ?? "",
                            country: $0.country ?? "",
                            company: $0.company ?? "",
                            description: $0.desciption ?? "",
                            id: $0.id ?? "")
            }
        } catch {
            print("Failed to fetch favorites: \(error)")
            return []
        }
    }
}
