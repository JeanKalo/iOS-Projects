//
//  CardModel.swift
//  financialapp
//
//  Created by Sioma on 9/03/22.
//

import Foundation
import SwiftUI


enum CreditCardType:String {
    case Joven
    case Maestro
    case admin
}

struct Card: Identifiable {
    var id : Int
    var cardColor : Color
    var offset: CGFloat = 0
    var owner : String
    var type : CreditCardType
    var listCircles : [BackgroundCircles] //Sólo puede tener 5,
    var monto : Double
}

class BackgroundCircles{
    internal init(color: Color, size: CGFloat, offset: CGFloat) {
        self.id = UUID()
        self.color = color
        self.size = size
        self.offset = offset
    }
    
    var id : UUID
    var color : Color
    var size : CGFloat
    var offset : CGFloat
    
}
