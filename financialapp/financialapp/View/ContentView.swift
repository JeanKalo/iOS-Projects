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
        VStack(alignment: .leading){
            Text("Hello world!")
                .font(.title)
            HStack{
                ZStack(alignment:Alignment(horizontal: .leading, vertical: .top)){
                    ForEach(homeVm.creditCards.indices.reversed(), id:\.self){ i in
                        CreditCard(
                            cardName: homeVm.creditCards[i],
                            backgroundCardColor: homeVm.backgroundCardColor[i]
                        )
                            .offset(
                                x:CreditCard.cardOffset(index: i),
                                y: CreditCard.cardOffset(index: i)
                            )
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged({ valueChange in
                                        print(valueChange)
                                    })
                                    .onEnded({ valueEnd in
                                        print(valueEnd)
                                    })
                            )
                    }
                }
                .padding(.trailing,30)
                .frame(width: .getScreenWidth, height: 400)
                .background(Color.gray.opacity(0.7))
                .clipped(antialiased: true)
            }
            
            Spacer()
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
