//
//  TodoSApp.swift
//  TodoS
//
//  Created by Sioma on 3/02/22.
//

import SwiftUI

@main
struct TodoSApp: App {
    
    let persistenceContainer = CoreDataManager.shared.persistenceContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceContainer.viewContext)
        }
    }
}
