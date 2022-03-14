//
//  CreditCard.swift
//  financialapp
//
//  Created by Sioma on 8/03/22.
//

import SwiftUI

struct CreditCard: View{
    var index : Int
    @Binding var swipedCardCounter : Int
    var card : Card
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            CardBackground(
                index: index,
                swipedCardCounter: $swipedCardCounter,
                color: card.cardColor
            )
            VStack{
                Text(card.owner)
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
    
    static func cardOffsetY(index : Int)->CGFloat{
        return index <= 3 ? CGFloat(index) * 20 : 20
    }
    
    static func cardOffsetX(index : Int)->CGFloat{
        return index <= 3 ? CGFloat(index) * 25 : 20
    }
    
}

struct CardBackground :View {
    var index : Int
    @Binding var swipedCardCounter : Int
    var color  : Color
    
    var body: some View{
        HStack{
//            Circle()
//                .fill(Color("Azul claro"))
//                .frame(width: .getScreenWidth * 0.9, height: 400)
//                .offset(x: 210, y: -160)
//
//            Circle()
//                .trim(from: 0.0, to: 1.0)
//                .fill(Color("Rosado"))
//                .frame(width: .getScreenWidth * 0.6, height: 500)
//                .offset(x: -310, y: 100)
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 15,style: .continuous))
        // mark: just show what is inside the frme bounds
        .clipped(antialiased: true)
    }
    
    func getWidth(index: Int)->CGFloat{
        let boxWidth = CGFloat.getScreenWidth - 60
        let cardWidth = (index - swipedCardCounter) <= 3 ? CGFloat(index) * 30 : 60
        return boxWidth - cardWidth
    }
    
    func getHeight(index: Int)->CGFloat {
        let boxHeight = CGFloat(200)
        let cardHeight = (index - swipedCardCounter) <= 2 ? CGFloat(index) * 20 : 40
        return boxHeight - cardHeight
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        CreditCard(
//            index: 2, swipedCardCounter: .constant(1),
//            card: Card(id: 0, cardColor: Color("Morado"), owner: "Jean Carlos 1")
//        )
    }
}
