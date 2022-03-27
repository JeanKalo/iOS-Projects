//
//  HomeViewModel.swift
//  financialapp
//
//  Created by Sioma on 8/03/22.
//

import Foundation
import SwiftUI

enum ServicesAllows : String,CaseIterable {
    case transferMoney = "Transferencia de dinero"
    case payments = "Pagos de nomina ó facturas"
    case takeOutMoney = "Retiro de dinero"
}

enum FocusableField : Hashable{
    case monto
    case destination
}

class HomeViewModel : ObservableObject{
    @Published var creditCards : [Card] = []
    
    @Published var swipedCardCounter = 0
    
    @Published var showCardDetail : Bool  = false
    
    @Published var service : ServicesAllows = .payments
    
    init(){
        self.creditCards =  [
            Card(
                id: 0,
                cardColor: Color("Morado"),
                owner: "Jean Carlos 1",
                type: .Joven,
                listCircles: [
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    )
                ],
                monto: 0.0
            ),
            Card(
                id: 1,
                cardColor: Color("Rosado"),
                owner: "Jean Carlos 2",
                type: .Joven,
                listCircles: [
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    ),
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    ),
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    )
                ],
                monto: 10000.0
            ),
            Card(
                id: 3,
                cardColor: Color("Azul claro"),
                owner: "Jean Carlos 3",
                type: .Joven,
                listCircles: [
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    ),
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    )
                ],
                monto: 1000.0
            ),
            Card(
                id: 4,
                cardColor: Color("signInColor"),
                owner: "Jean Carlos 4",
                type: .Joven,
                listCircles: [
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    ),
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    ),
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    ),
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    ),
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    )
                ],
                monto: 10.0
            ),
            Card(
                id: 5,
                cardColor: Color("Morado"),
                owner: "Jean Carlos 5",
                type: .Joven,
                listCircles: [
                    BackgroundCircles(
                        color: self.colors.randomElement() ?? Color("Morado"),
                        size: self.random_size(),
                        offset: self.random_offset()
                    )
                ],
                monto: 5000.0
            )
        ]
    }
    var colors : [Color] = [
        Color("circle_gray"),
        Color("loginColor"),
        Color("loginColor2"),
        Color("signInColor")
    ]
    
    func random_offset()->CGFloat{
        return CGFloat.random(in: 0.0..<40.0)
    }
    
    func random_size()->CGFloat{
        return CGFloat.random(in: 20.0..<60.0)
    }
    
    
}
