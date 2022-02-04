//
//  CardViewModel.swift
//  Edvora
//
//  Created by Ahmad Yasser on 03/02/2022.
//

import Foundation
// MARK: - Card
struct Card: Codable, Identifiable {
   
    let id = UUID()
    let productName, brandName: String
    let price: Int
    let address: Address
    let discription, date, time: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case brandName = "brand_name"
        case price, address, discription, date, time, image
    }
}

// MARK: - Address
struct Address: Codable {
    let state, city: String
}
