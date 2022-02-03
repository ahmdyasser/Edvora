//
//  ContentView.swift
//  Edvora
//
//  Created by Ahmad Yasser on 03/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedFilter = "filters"
    @State private var selectedProduct = 0
    @State private var selectedState = 0
    @State private var selectedCity = 0
    
    let filters = ["No Filter", "Products", "State", "City"]
    @State private var selection = "Red"
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]
    let network = NetworkManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(Color("background"))
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("clear filter")
                                    .fontWeight(.regular)
                                    .foregroundColor(.white)
                            }
                            
                        }
                    
                      
                        ProductsView(productName: "Product Name")
                        ProductsView(productName: "Shoes")
                        
                       
                    }
                    
                }
                .padding()
            }
            
            
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
    var body: some View {
        let address = Address(state: "state", city: "city")
        let card = Card(productName: "Product Name", brandName: "brand Name", price: 9, address: address, discription: "Its a good product", date: "2022-2-2", time: "12:21", image: "unnamed")
        
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
