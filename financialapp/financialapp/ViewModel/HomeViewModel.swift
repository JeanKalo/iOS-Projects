//
//  HomeViewModel.swift
//  financialapp
//
//  Created by Sioma on 8/03/22.
//

import Foundation
import SwiftUI


class HomeViewModel : ObservableObject{
    @Published var creditCards = [
        Card(id: 0, cardColor: Color("Morado"), owner: "Jean Carlos 1"),
        Card(id: 1, cardColor: Color("Rosado"), owner: "Jean Carlos 2"),
        Card(id: 2, cardColor: Color("Azul claro"), owner: "Jean Carlos 3"),
        Card(id: 3, cardColor: .orange, owner: "Jean Carlos 4"),
        Card(id: 4, cardColor: .green, owner: "Jean Carlos 5"),
        Card(id: 5, cardColor: Color("Morado"), owner: "Jean Carlos 1"),
        Card(id: 6, cardColor: Color("Rosado"), owner: "Jean Carlos 2"),
        Card(id: 7, cardColor: Color("Azul claro"), owner: "Jean Carlos 3"),
        Card(id: 8, cardColor: .orange, owner: "Jean Carlos 4"),
        Card(id: 9, cardColor: .green, owner: "Jean Carlos 5"),
        Card(id: 10, cardColor: Color("Morado"), owner: "Jean Carlos 1"),
        Card(id: 11, cardColor: Color("Rosado"), owner: "Jean Carlos 2"),
        Card(id: 12, cardColor: Color("Azul claro"), owner: "Jean Carlos 3"),
        Card(id: 13, cardColor: .orange, owner: "Jean Carlos 4"),
        Card(id: 14, cardColor: .green, owner: "Jean Carlos 5"),
        Card(id: 15, cardColor: Color("Morado"), owner: "Jean Carlos 1"),
        Card(id: 16, cardColor: Color("Rosado"), owner: "Jean Carlos 2"),
        Card(id: 17, cardColor: Color("Azul claro"), owner: "Jean Carlos 3"),
        Card(id: 18, cardColor: .orange, owner: "Jean Carlos 4"),
        Card(id: 19, cardColor: .green, owner: "Jean Carlos 5"),
        Card(id: 20, cardColor: Color("Morado"), owner: "Jean Carlos 1"),
        Card(id: 21, cardColor: Color("Rosado"), owner: "Jean Carlos 2"),
        Card(id: 22, cardColor: Color("Azul claro"), owner: "Jean Carlos 3"),
        Card(id: 23, cardColor: .orange, owner: "Jean Carlos 4"),
        Card(id: 24, cardColor: .green, owner: "Jean Carlos 5"),
        Card(id: 25, cardColor: Color("Morado"), owner: "Jean Carlos 1"),
        Card(id: 26, cardColor: Color("Rosado"), owner: "Jean Carlos 2"),
        Card(id: 27, cardColor: Color("Azul claro"), owner: "Jean Carlos 3"),
        Card(id: 28, cardColor: .orange, owner: "Jean Carlos 4"),
        Card(id: 29, cardColor: .green, owner: "Jean Carlos 5"),
        Card(id: 30, cardColor: Color("Morado"), owner: "Jean Carlos 1"),
    ]
    
    @Published var swipedCardCounter = 0 
}
