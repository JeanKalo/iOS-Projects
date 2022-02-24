//
//  ContentView.swift
//  InfinitiveScroll
//
//  Created by Sioma on 24/02/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataVm = InfinitiveViewModel()
    var body: some View {
        
        
        ScrollViewReader { reader in
            List {
                ForEach(0...dataVm.data.count,id:\.self) { x in
                    //Valida si ya llego al top y debe mostrar el loading
                    if x == dataVm.data.count {
                        HStack {
                            if !dataVm.couldRefreshMore {
                                Text("Actualizado hasta la fecha actual")
                                    .padding(10)
                                    .font(.footnote)
                                    .background(Color.yellow)
                                    .onTapGesture {
                                        print("RESET DATA")
                                        dataVm.resetData()
                                        withAnimation {
                                            reader.scrollTo(0, anchor: .top)
                                        }
                                        
                                    }
                            }else{
                                ProgressView()
                                    .onAppear {
                                        if dataVm.couldRefreshMore && !dataVm.isResetingData {
                                            print("Load more data")
                                            dataVm.loadMoreData()
                                        }else{
                                            print("LLegamos al final \(dataVm.numberOfPack*dataVm.pack)")
                                        }
                                    }
                            }
                        }
                        .padding(50)
                        .frame(maxWidth: .infinity)
                        .listRowInsets(.none)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.white)
                        .listSectionSeparator(.hidden)
                        
                    }
                    else {
                        Text(dataVm.data[x].description)
                            .padding(50)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .listRowInsets(.none)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.white)
                            .listSectionSeparator(.hidden)
                            .id(x)
                    }
                }
            }
            .listStyle(.plain)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
