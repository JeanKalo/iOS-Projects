//
//  CarInfoPhotos.swift
//  CarExmaple
//
//  Created by Sioma on 24/02/22.
//

import SwiftUI

struct CarInfoPhotos: View {
    var body: some View {
        VStack (alignment: .leading, spacing : 10){
            Text("Car Interior")
                .fontWeight(.medium)
                .font(.system(size: 15))
                .foregroundColor(.gray)
            HStack{
                Image(systemName: "car")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 180, height: 100)
                
                Image(systemName: "car")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 180, height: 100)
            }
        }
    }
}

struct CarInfoPhotos_Previews: PreviewProvider {
    static var previews: some View {
        CarInfoPhotos()
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
