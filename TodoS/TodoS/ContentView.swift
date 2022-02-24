//
//  ContentView.swift
//  TodoS
//
//  Created by Sioma on 3/02/22.
//

import SwiftUI


enum Priority : String, Identifiable,CaseIterable {
    var id : UUID{
        return UUID()
    }
    
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

extension Priority {
    
    var title : String {
        switch self {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
    
}


struct ContentView: View {
    
    //De está manera se obtiene el contexto el cual hace referencia a el environmentObject pasado en el main
    @Environment(\.managedObjectContext) private var viewContext
    
    //este es un nuevo property wrapper con el cual se espera hacer una peticion a la base de datos para traer datos
    
    @FetchRequest( entity: Task.entity(), sortDescriptors: [  ]   ) private var allTasks : FetchedResults<Task>
    
    @State private var title : String = ""
    
    @State private var selectedPriority : Priority = .medium
    
    
    private func  saveTask(){
        do{
            let task = Task(context: viewContext)
            task.title = title
            task.priority = selectedPriority.rawValue
            task.created_at = Date()
            try viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    private func updateTask(_ task:Task){
        task.isFavorite.toggle()
        
        do{
            try viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    private func deleteTask(at offSets : IndexSet){
        offSets.forEach { index in
            let task = allTasks[index]
            viewContext.delete(task)
            
            do{
                try viewContext.save()
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }
    
    private func styleforPriority(_ value : String ) -> Color {
        let priority = Priority(rawValue: value)
        switch priority {
        case .low:
            return Color.green
        case .medium:
            return Color.orange
        case .high:
            return Color.red
        case .none:
            return Color.gray
        }
        
    }
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                TextField("Enter title",text:$title)
                    .textFieldStyle(.roundedBorder)
                
                Picker("Priority", selection: $selectedPriority) {
                    ForEach(Priority.allCases) { priority in
                        Text(priority.title).tag(priority)
                    }
                }
                .pickerStyle(.segmented)
                
                Button("Save"){
                    saveTask()
                }
                .padding(10)
                .frame(maxWidth:.infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10.0,style: .continuous))
                
                Spacer()
                
                
                List{
                    ForEach(allTasks){ task in
                        
                        HStack {
                            
                            Circle()
                                .fill(styleforPriority(task.priority!))
                                .frame(width: 15, height: 15)
                            Spacer()
                                .frame(width: 20)
                            Text(task.title ?? "empty")
                            Spacer()
                            Image(systemName: task.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .onTapGesture {
                                    updateTask(task)
                                }
                        }
                        
                    }.onDelete(perform: deleteTask)
                }
                
                
                
                
                
                
            }
            .padding()
            .navigationTitle("All Tasks")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let persistenceContainer = CoreDataManager.shared.persistenceContainer
        ContentView().environment(\.managedObjectContext, persistenceContainer.viewContext)
    }
}
