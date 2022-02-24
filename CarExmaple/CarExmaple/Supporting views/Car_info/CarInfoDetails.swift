//
//  CarInfoDetails.swift
//  CarExmaple
//
//  Created by Sioma on 24/02/22.
//

import SwiftUI

struct CarInfoDetails: View {
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text("Transmisión")
                    .font(.custom("AvenirNextCondensed-Bold", size: 16))
                    .foregroundColor(.gray)
                Text("Automatic")
                    .font(.custom("AvenirNextCondensed-Bold", size: 22))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
            Spacer()
            VStack(alignment:.leading){
                Text("Class")
                    .font(.custom("AvenirNextCondensed-Bold", size: 16))
                    .foregroundColor(.gray)
                Text("Luxury")
                    .font(.custom("AvenirNextCondensed-Bold", size: 22))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
            Spacer()
            VStack(alignment:.leading){
                Text("Year")
                    .font(.custom("AvenirNextCondensed-Bold", size: 16))
                    .foregroundColor(.gray)
                Text("2020")
                    .font(.custom("AvenirNextCondensed-Bold", size: 22))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
            
        }
    }
}

struct CarInfoDetails_Previews: PreviewProvider {
    static var previews: some View {
        CarInfoDetails()
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
