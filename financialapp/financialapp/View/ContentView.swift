//
//  ContentView.swift
//  financialapp
//
//  Created by Sioma on 7/03/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeVm  = HomeViewModel()
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack{
                Text("Hello world!")
                    .font(.title)
                ZStack{
                    ForEach(homeVm.creditCards,id:\.self) {
                        CreditCard(cardName: $0)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension CGFloat {
    static var getScreenWidth : CGFloat {
        UIScreen.main.bounds.size.width 
    }
}
