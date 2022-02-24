//
//  Color_extension.swift
//  CarExmaple
//
//  Created by Jean Carlos Quejada Toro on 24/02/22.
//

import Foundation
import SwiftUI

extension Color{
    static var baseGray = Color("isabelline")
}


extension UIColor{
    static var baseGray = Color(named:"isabelline")
    
    private static func  Color(named key : String)->UIColor{
        if let color = UIColor(named: key){
            return color
        }
        return .black
    }
    
}
