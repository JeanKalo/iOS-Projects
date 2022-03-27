//
//  ProjectViewModel.swift
//  financialapp
//
//  Created by Sioma on 26/03/22.
//

import Foundation
import SwiftUI

enum Colors: String,CaseIterable{
    case circle_gray = "circle_gray"
    case loginColor  = "loginColor"
    case loginColor2 = "loginColor2"
    case signInColor = "signInColor"
    case ffca2b =  "#ffca2b"
    case f5836 = "#3f5836"
    case ef8c66 = "#ef8c66"
    case eff66 = "#8eff66"
    case f4699c = "#f4699c"
    case color1 = "#693330"
}

class ProjectViewModel : ObservableObject {
    @Published var card = Card(
        id: 0,
        cardColor: Color("Morado"),
        owner: "Jean Carlos 1",
        type: .Joven,
        listCircles: [],
        monto: 0.0
    )
    
    var colors : [Color] = [
        Color("Morado"),
        Color("Rosado"),
        Color("Azul claro"),
        Color("circle_gray"),
        Color("loginColor"),
        Color("loginColor2"),
        Color("signInColor"),
        Color("#ffca2b"),
        Color("#3f5836"),
        Color("#ef8c66"),
        Color("#8eff66"),
        Color("#f4699c"),
        Color("#693330")
    ]
    
    func random_offset()->CGFloat{
        return CGFloat.random(in: 0.0..<40.0)
    }
    
    func random_size()->CGFloat{
        return CGFloat.random(in: 20.0..<60.0)
    }
    
    func addCircles(_ number : Int){
        for _ in 0..<number{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.card.listCircles.append(
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    )
                )
            }
        }
    }
    
    func removeCircle(){
        card.listCircles.removeAll()
    }
    
}
