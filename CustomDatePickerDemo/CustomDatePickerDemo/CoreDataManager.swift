//
//  CoreDataManager.swift
//  Petwatch
//
//  Created by Doğanay Şahin on 22.04.2022.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let persistentContainer : NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    

    
    
    
    func getInfoById(id: NSManagedObjectID) -> ListItems? {
        
        do {
            return try viewContext.existingObject(with: id) as? ListItems
        } catch {
            return nil
        }
        
    }
    
    func deleteInfo(task: ListItems) {
        
        viewContext.delete(task)
        save()
        
    }
    
    
    
    func getAllInformation() -> [ListItems] {
        let request : NSFetchRequest<ListItems> = ListItems.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    
    
    func save(){
        do {
            try viewContext.save()
        }catch{
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "TaskList")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
    
}
