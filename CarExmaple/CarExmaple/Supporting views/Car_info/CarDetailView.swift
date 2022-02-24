//
//  CarInfoView.swift
//  CarExmaple
//
//  Created by Sioma on 24/02/22.
//

import SwiftUI

struct CarDetailView: View {
    var body: some View {
        ZStack {
            VStack{
                Image(systemName: "car")
            }
            VStack {
                CarInfoBasic()
                CarInfoDetails()
                CarInfoPhotos()
            }
            .background(Color.baseGray)
        }
    }
}

struct CarInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView()
    }
}
