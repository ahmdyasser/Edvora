//
//  NetworkManager.swift
//  Edvora
//
//  Created by Ahmad Yasser on 03/02/2022.
//

import Foundation

class NetworkManager {
    var card: Card?
    let urlString = "https://assessment-edvora.herokuapp.com"
    init() {
        if let url = URL(string: self.urlString) {
            do {
                if let data = try? Data(contentsOf: url) {
                    parse(json: data)
                }
            }
            
        }
    }
    func parse(json: Data) {
        let decoder = JSONDecoder()
        do {
            if let jsonCard = try? decoder.decode(Card.self, from: json) {
                card = jsonCard
            }
        }
    }
}
