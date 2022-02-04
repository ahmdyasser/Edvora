//
//  ContentView.swift
//  Edvora
//
//  Created by Ahmad Yasser on 03/02/2022.
//

import SwiftUI

struct ContentView: View {
    let formatter = DateFormatter()
    
    @State private var selectedFilter = "filters"
    @State private var selectedProduct = 0
    @State private var selectedState = 0
    @State private var selectedCity = 0
    @State var formatedDate = ""
    
    @State var cards: [Card] = []
    
    @State private var selection = ""
    @State private var showingPopover = false
  
    var body: some View {
        
        NavigationView {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(Color("background"))
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Button {
                                showingPopover = true
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color("darker"))
                                        .cornerRadius(10)
                                    HStack(spacing: 30) {
                                        Text("Filters")
                                            .foregroundColor(.white)
                                       
                                        Image(systemName: "arrowtriangle.down.fill")
                                            .foregroundColor(.white)
                                        
                                    }
                                    .padding()
                                }
                               
                            }.popover(isPresented: $showingPopover) {
                                FilterView(items: ["filter1", "2"])
                            }
            
                            Spacer()
                            
                            
                            Button {
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color("darker"))
                                        .cornerRadius(10)
                                    HStack(spacing: 30) {
                                        Text("clear filter")
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    ForEach(cards) { card in
                        ProductsView(productName: "Product Name", card: card)
                            .padding(.vertical, 30)
                    }
                }
                .padding()
                .onAppear {
                   NetworkManager().fetch { (cards) in
                       self.cards = cards
                   }
               }
            }
            .navigationTitle("Edvora")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}



struct ProductsView: View {
    
    let productName: String
    let card: Card
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(productName)")
                .foregroundColor(.white)
                .fontWeight(.regular)
                .font(.system(size: 20))
                .ignoresSafeArea()
            
            Rectangle()
                .frame(width: 300, height: 0.5)
                .foregroundColor(.white)
                .padding(.vertical, 6)
            
            ScrollView(.horizontal) {
                HStack {
                    CardView(card: card)
                    CardView(card: card)
                    CardView(card: card)
                }
            }
        }
    }
}
