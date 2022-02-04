//
//  CardView.swift
//  Edvora
//
//  Created by Ahmad Yasser on 03/02/2022.
//

import SwiftUI

struct CardView: View {
    var card: Card
    @State var favoriteFruit = ""
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        if #available(iOS 15.0, *) {
                            AsyncImage(url: URL(string: card.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                Color.red
                            }
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else {
                            // Fallback on earlier versions
                        }
                        Text("\(card.address.state), \(card.address.city)")
                            .frame(maxWidth: 150)
                            .foregroundColor(Color(K.Color.white))
                            .font(.system(size: 13))
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(card.productName)")
                            .fontWeight(.semibold)
                        Text("\(card.brandName)")
                            .fontWeight(.light)
                        Text("$\(card.price)")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Date: \(card.date)")
                            .font(.system(size: 13))
                    }
                    .frame(maxWidth: 150)
                    .foregroundColor(Color(K.Color.white))
                }
                
                Text("\(card.discription)")
                    .foregroundColor(Color(K.Color.white))
                    .font(.system(size: 13))
                    .multilineTextAlignment(.leading)
                
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
        
        
        
        let card = Card(productName: "product name", brandName: "brand name", price: 12, address: address, discription: "hello", date: stringDate, time: "12:00", image: "unnamed")
        
        CardView(card: card)
    }
}
