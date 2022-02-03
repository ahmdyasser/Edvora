//
//  CardView.swift
//  Edvora
//
//  Created by Ahmad Yasser on 03/02/2022.
//

import SwiftUI

struct CardView: View {
    var card: Card
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Image("\(card.image)")
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: 80, height: 80)
                        Text("\(card.address.state) \(card.address.city)")
                            .foregroundColor(.white)
                            .fontWeight(.light)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(card.productName)")
                            .fontWeight(.semibold)
                        Text("\(card.brandName)")
                            .fontWeight(.light)
                        Text("$\(card.price)")
                            .fontWeight(.semibold)
                        Text("Date: \(card.date)")
                            .fontWeight(.light)
                    }
                    .foregroundColor(.white)
                    
                }
                Text("\(card.discription)")
                    .foregroundColor(.white)
                    .fontWeight(.light)
                    .navigationTitle("Edvora")
            }
        }
        .padding()
        .background(Color("card"))
        .cornerRadius(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let formatter = DateFormatter()
        let date = Date()
        let stringDate =  formatter.string(from: date)
        let address = Address(state: "state", city: "city")
        
        let card = Card(productName: "Product Name", brandName: "brand Name", price: 9, address: address, discription: "Its a good product", date: stringDate, time: "12:21", image: "unnamed")
        
        CardView(card: card)
    }
}
