//
//  CarInfoBasic.swift
//  CarExmaple
//
//  Created by Sioma on 24/02/22.
//

import SwiftUI

struct CarInfoBasic: View {
    var body: some View {
        VStack(alignment:.leading,spacing: 8){
            HStack{
                Text("TESLA MODEL 5")
                    .fontWeight(.bold)
                    .font(.custom("AvenirNextCondensed-Bold", size: 28))
                Spacer()
                Image(systemName: "info.circle")
                    .font(.system(size: 28))
            }
            VStack(alignment:.leading,spacing: 4){
                Text("$80/hr")
                    .font(.custom("AvenirNextCondensed-Bold", size: 18))
                    .foregroundColor(.gray)
                HStack {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { _ in
                        Image(systemName: "star.fill")
                    }
                }
            }
        }
    }
}

struct CarInfoBasic_Previews: PreviewProvider {
    static var previews: some View {
        CarInfoBasic()
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
