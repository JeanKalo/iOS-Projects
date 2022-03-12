//
//  ContentView.swift
//  financialapp
//
//  Created by Sioma on 7/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var homeVm : HomeViewModel = HomeViewModel()
        
    var body: some View {
        VStack(alignment: .leading){
            AppBar()
            HStack{
                ZStack(alignment:Alignment(horizontal: .leading, vertical: .top)){
                    
                    ForEach(homeVm.creditCards.indices.reversed(), id:\.self){ i in
                        
                        HStack{
                            CreditCard(
                                index: i,
                                swipedCardCounter: $homeVm.swipedCardCounter,
                                card: homeVm.creditCards[i]
                            )
                                .frame(width: getWidth(index: i), height: getHeight(index: i))
                                .offset(
                                    x: CreditCard.cardOffsetX(index: i - homeVm.swipedCardCounter),
                                    y:-CreditCard.cardOffsetY(index: i - homeVm.swipedCardCounter)
                                )
                        }
                        .contentShape(Rectangle())
                        .frame(height: 200)
                        .offset(
                            x: homeVm.creditCards[i].offset,
                            y: homeVm.creditCards[i].offset
                        )
                        .rotationEffect(.degrees(angleByCard(index: i)))
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged({ value in
                                    onChanged(value: value, index: i)
                                })
                                .onEnded({ value in
                                    onEnded(value: value, index: i)
                                })
                        )
                    }
                }
                .frame(width: .getScreenWidth, height: 250)
//                .background(Color.gray.opacity(0.01))
                
            }
            HStack{
                Spacer()
                Image(systemName: "arrow.right")
                    .foregroundColor(Color("Morado"))
                    .padding(4)
                    .background(
                        Circle()
                            .strokeBorder(Color.black,lineWidth: 1)
                    )
                    
                Text("Return cards")
                Spacer()
                
            }
            .padding(5)
            .onTapGesture {
                for index in homeVm.creditCards.indices.reversed(){
                    withAnimation {
                        homeVm.creditCards[index].offset = 0
                        homeVm.swipedCardCounter = 0
                    }
                }
            }
            
            Transactions()
        }
        .background(Color.gray.opacity(0.03))
    }
    
    func onChanged(value : DragGesture.Value, index : Int){
        //Sólo movimiento hacia arriba
        if value.translation.height < 0 {
            homeVm.creditCards[index].offset = value.translation.height
        }
    }
    
    func onEnded(value : DragGesture.Value, index : Int){
        withAnimation {
            if value.translation.height < -200 {
                homeVm.creditCards[index].offset = -500
                homeVm.swipedCardCounter += 1
            }else{
                homeVm.creditCards[index].offset = 0
            }
        }
    }
    
    func angleByCard(index : Int)->Double {
        withAnimation {
            let offset = homeVm.creditCards[index].offset
            let minimumValue = CGFloat(-30)
            if offset == 0.0{
                return 0.0
            }else if offset >= minimumValue {
                return  Double(offset)
            }
            return minimumValue
        }
    }
    
    func getWidth(index: Int)->CGFloat {
        let boxWidth = CGFloat.getScreenWidth - 60
        let cardWidth = (index - homeVm.swipedCardCounter) <= 3 ? CGFloat(index) * 30 : 60
        return boxWidth - cardWidth
    }
    
    func getHeight(index: Int)->CGFloat {
        let boxHeight = CGFloat(200)
        let cardHeight = (index - homeVm.swipedCardCounter) <= 2 ? CGFloat(index) * 20 : 40
        return boxHeight - cardHeight
    }
}

struct AppBar : View{
    var body: some View{
        HStack{
            //MARK: name
            VStack(alignment:.leading){
                Text("Hola!")
                    .font(.system(size: 12, weight: .heavy))
                    .foregroundColor(.gray)
                Text("Jean Carlos")
                    .font(.system(size: 15, weight: .heavy))
                    .foregroundColor(.black)
            }
            Spacer()
            //MARK: photo
            Image(systemName: "applelogo")
                .foregroundColor(Color("Morado"))
                .padding(4)
                .background(
                    Circle()
                        .strokeBorder(Color.black,lineWidth: 1)
                )
        }
        .padding(.horizontal,30)
    }
}

struct Transactions : View {
    var body: some View{
        VStack{
            HStack{
                Text("Transactions")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
            }
            .padding(30)
            List(0..<5){ _ in
                TransactionItem()
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .frame(width: .getScreenWidth, height: .getScreenHeight / 2)
        .background(
            RoundedRectangle(cornerRadius: 40,style: .continuous)
                .fill(Color.white)
                .ignoresSafeArea()
        )
        
    }
}

struct TransactionItem:View{
    var body: some View{
        VStack {
            HStack{
                VStack(alignment:.leading){
                   Text("Pago de nomina")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.black)
                    Text("income")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment:.leading){
                    Text("-$144.00")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.red)
                     Text("18 Sept 2020")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                }
            }
            
            
            Rectangle()
                .fill(Color.gray.opacity(0.1))
                .frame( height: 1)
        }
        .padding(.horizontal,30)
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
    static var getScreenHeight : CGFloat {
        UIScreen.main.bounds.size.height
    }
}


struct RotateViewModifier : ViewModifier{
    func body(content: Content) -> some View {
        content.foregroundColor(Color.red)
    }
}
