//
//  CreditCard.swift
//  financialapp
//
//  Created by Sioma on 8/03/22.
//

import SwiftUI

var foreGroundColor : Color = .white

struct CreditCard: View{
    var index : Int
    @Binding var swipedCardCounter : Int
    var card : Card
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            CardBackground(
                index: index,
                swipedCardCounter: $swipedCardCounter,
                color: card.cardColor,
                card: card
            )
            VStack(alignment:.leading){
                //MARK: logoTipo y validación
                HStack{
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(foreGroundColor)
                        Text("$")+Text(String(format:"%.1f",card.monto))
                            .font(.system(size: 18,weight: .semibold))
                            .foregroundColor(foreGroundColor)
                    }
                    Spacer()
                    Image("cardIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                }
                
                Spacer()
                
                //MARK: card number
                Text("**** **** **** 5647")
                    .font(.system(size: 25,weight: .semibold))
                    .foregroundColor(foreGroundColor)
                
                Spacer()
                
                //MARK: owner, expirationDate
                HStack{
                    KeyValueView(key:card.owner , value: card.type.rawValue)
                    Spacer()
                    HStack{
                        KeyValueView(key: "06/26" , value: "expiration")
                        KeyValueView(key: "123", value: "CVS")
                    }
                }
            }
            .padding()
        }
    }

    
    static func cardOffsetY(index : Int)->CGFloat{
        return index <= 3 ? CGFloat(index) * 20 : 20
    }
    
    static func cardOffsetX(index : Int)->CGFloat{
        return index <= 3 ? CGFloat(index) * 25 : 20
    }
    
    @ViewBuilder func text()->some View{
        Text("hola")
    }
}

struct KeyValueView : View{
    var key : String
    var value : String
    var body: some View{
        VStack(alignment:.leading) {
            Text(key)
                .font(.system(size: 18,weight: .semibold))
                .foregroundColor(foreGroundColor)
            Text(value)
                .font(.caption)
                .foregroundColor(foreGroundColor)
        }
    }
}

struct CardBackground :View {
    var index : Int
    
    @Binding var swipedCardCounter : Int
    
    var color  : Color
    
    var card : Card
    
    var body: some View{
        HStack{
            ForEach(card.listCircles,id:\.id) { circle in
                Circle()
                    .fill(circle.color)
                    .frame(width: circle.size, height: circle.size)
                    .offset(x: circle.offset, y: circle.offset)
            }
        }
        .frame(maxWidth: CGFloat.getScreenWidth - 60, maxHeight: .infinity)
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
