//
//  CreditCard.swift
//  financialapp
//
//  Created by Sioma on 8/03/22.
//

import SwiftUI

struct CreditCard: View {
    var cardName : String
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            CardBackground()
            VStack{
                Text(cardName)
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
}

struct CardBackground :View {
    var body: some View{
        HStack{
            Circle()
                .fill(Color("Azul claro"))
                .frame(width: .getScreenWidth * 0.9, height: 400)
                .offset(x: 210, y: -160)
            
            Circle()
                .trim(from: 0.0, to: 1.0)
                .fill(Color("Rosado"))
                .frame(width: .getScreenWidth * 0.6, height: 500)
                .offset(x: -310, y: 100)
                
        }
        .frame(width: .getScreenWidth - 50, height: 200)
        .background(Color("Morado"))
        .clipShape(RoundedRectangle(cornerRadius: 15,style: .continuous))
        
        // mark: just show what is inside the frme bounds
        .clipped(antialiased: true)

        
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard(cardName: "JENYUS")
    }
}
