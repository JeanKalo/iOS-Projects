//
//  CreatNewCardView.swift
//  financialapp
//
//  Created by Sioma on 26/03/22.
//

import SwiftUI
import Combine

struct CreatNewCardView: View {
    
    @StateObject var projectVm  = ProjectViewModel()
    
    @State var bg_color_selected : Int = 0
    
    @State var numberOfcircles : Int = 0
    
    var body: some View {
        Form{
            cardSection
            backgroundColor
            backgroundCircles
            saveButton
        }
        .navigationTitle("New card")
    }
    
    var cardSection : some View{
        Section("Card"){
            CreditCard(
                index: 0,
                swipedCardCounter: .constant(0),
                card: projectVm.card
            )
                .frame(
                    width: CGFloat.getScreenWidth - 60,
                    height: 200
                )
        }
    }
    
    var backgroundColor : some View{
        Section("Background"){
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(projectVm.colors.indices){ x in
                        Circle()
                            .fill(projectVm.colors[x])
                            .frame(width: 20, height: 20)
                            .shadow(
                                color: bg_color_selected == x ? Color("grayColor") : Color.white ,
                                radius: 4, x: 2, y: 2
                            )
                            .overlay(
                                Image(systemName: "checkmark.circle")
                                    .font(.system(size: 18))
                                    .foregroundColor( bg_color_selected == x ? .white : projectVm.colors[x] )
                                
                            )
                            .onTapGesture {
                                withAnimation {
                                    bg_color_selected = x
                                    projectVm.card.cardColor =  projectVm.colors[x]
                                }
                            }
                        
                    }
                }.padding()
            }
        }
    }
    
    var backgroundCircles : some View{
        Section("Circles"){
            Picker("How many circles do you want?", selection: $numberOfcircles){
                ForEach(0..<6) { i in
                    Text("\(i)")
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: numberOfcircles) { newValue in
                withAnimation {
                    projectVm.removeCircle()
                    projectVm.addCircles(newValue)
                }
            }
        }
    }
    
    var saveButton : some View{
        Section{
            Button {
               print("Saving new account")
            } label: {
                Text("Save new card")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .font(.system(size: 20,weight: .medium))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
        }
    }
    
}

struct CreatNewCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreatNewCardView()
    }
}
