
import Foundation

import CoreData

class CoreDataManager {
    
    let persistenceContainer : NSPersistentContainer
    
    static let shared : CoreDataManager = CoreDataManager()
    
    private init(){
        
        persistenceContainer = NSPersistentContainer(name: "SimpleTodoModel")
        
        persistenceContainer.loadPersistentStores { description, error in
            
            if let error = error{
                
                fatalError("Unable to initialize core data \(error)")
                
            }
            
        }
        
        
    }
    
    
}
