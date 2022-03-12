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
    ]
    
    @Published var swipedCardCounter = 0 
}
