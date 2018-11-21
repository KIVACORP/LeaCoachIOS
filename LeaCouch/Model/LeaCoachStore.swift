//
//  LeaCoachStore.swift
//  LeaCouch
//
//  Created by ALEXIS-PC on 11/21/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class LeaCoachStore {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let myFavoriteEntityName = "MyFavorite"
    
    func save() {
        delegate.saveContext()
    }
    func addFavorite(for publication: Publication) {
        let entityDescription = NSEntityDescription.entity(forEntityName: myFavoriteEntityName, in: context)
        let favorite = NSManagedObject(entity: entityDescription!, insertInto: context)
        favorite.setValue(publication.id, forKey: "myFavoriteId")
        favorite.setValue(publication.name, forKey: "myFavoriteName")
        save()
    }
    func findFavoriteBy(predicate: NSPredicate, for publication: Publication) -> NSManagedObject? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: myFavoriteEntityName)
        request.returnsObjectsAsFaults = false
        
        let predicate = predicate
        request.predicate = predicate
        do {
            let result = try context.fetch(request)
            return result.first as? NSManagedObject
        } catch let error {
            print("Request Error: \(error.localizedDescription)")
        }
        return nil
    }
    func findFavoriteById(for publication: Publication) -> NSManagedObject? {
        let predicate = NSPredicate(format: "myFavoriteId = %@", publication.id)
        return findFavoriteBy(predicate: predicate, for: publication)
    }
    func findFavoriteByName(for publication: Publication) -> NSManagedObject? {
        let predicate = NSPredicate(format: "myFavoriteName = %@", publication.name)
        return findFavoriteBy(predicate: predicate, for: publication)
    }
    func deleteFavorite(for publication: Publication) {
        if let objectId = findFavoriteById(for: publication)?.objectID {
            let request = NSBatchDeleteRequest(objectIDs: [objectId])
            do {
                try context.execute(request)
                save()
            } catch let error {
                print("Delete Error: \(error.localizedDescription)")
            }
        }
    }
    func findAllFavorites() -> [NSManagedObject]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: myFavoriteEntityName)
        do {
            let result = try context.fetch(request)
            return result as? [NSManagedObject]
        } catch let error {
            print("Query Error: \(error.localizedDescription)")
        }
        return nil
    }
    func isFavorite( publication: Publication) -> Bool {
        return findFavoriteById(for: publication) != nil
    }
    func setFavorite(_ isFavorite: Bool, for publication: Publication) {
        if self.isFavorite(publication: publication) == isFavorite {
            return
        }
        if isFavorite {
            addFavorite(for: publication)
        } else {
            deleteFavorite(for: publication)
        }
    }
    
    func favorite(publication: Publication) {
        setFavorite(true, for: publication)
    }
    
    func unFavorite(publication: Publication) {
        setFavorite(false, for: publication)
    }
    
    func favoritePublicationIdAsString() -> String {
        let publications = findAllFavorites()
        if let publications = publications {
            return publications.map({ $0.value(forKey: "myFavoriteId") as! String })
            .filter({ !$0.isEmpty })
            .prefix(20)
            .joined(separator: ",")
        }
        return ""
    }
}
