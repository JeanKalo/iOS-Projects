//
//  CardModel.swift
//  financialapp
//
//  Created by Sioma on 9/03/22.
//

import Foundation
import SwiftUI


struct Card: Identifiable {
    var id : Int
    var cardColor : Color
    var offset: CGFloat = 0
    var owner : String
}
