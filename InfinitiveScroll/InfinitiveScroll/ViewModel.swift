//
//  ViewModel.swift
//  InfinitiveScroll
//
//  Created by Sioma on 24/02/22.
//

import Foundation
import SwiftUI

class InfinitiveViewModel : ObservableObject {
    @Published var data : [Int] = []
    
    private(set) var numberOfPack : Int = 0
    
    private(set) var pack : Int = 30
    
    private(set) var limit = 100
    
    init() {
        self.data.append(contentsOf: Array(1...self.pack))
        self.numberOfPack = 1
    }
    
    private(set) var isResetingData : Bool = false
    
    var couldRefreshMore : Bool {
        !(numberOfPack*pack >= limit)
    }
    
    func loadMoreData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.spring()) {
                let startIndex = (self.numberOfPack * self.pack) + 1
                let endIndex = (self.numberOfPack + 1) * self.pack
                self.data.append( contentsOf: Array(startIndex...endIndex) )
                self.numberOfPack += 1
            }
            
        }
    }
    
    func resetData(){
        self.isResetingData = true
        self.numberOfPack = 1
        let firstPart = data[0..<pack]
        self.data = Array(firstPart)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.isResetingData = false
        }
    }
    
}
