//
//  NetworkManager.swift
//  Edvora
//
//  Created by Ahmad Yasser on 03/02/2022.
//

import Foundation
class NetworkManager {
        
    func fetch(completion: @escaping ([Card]) -> ()) {
        guard let url = URL(string: "https://assessment-edvora.herokuapp.com") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let cards = try jsonDecoder.decode([Card].self, from: data)
                    print(cards)
                    DispatchQueue.main.async {
                        completion(cards)
                    }
                } catch {
                    debugPrint(error.localizedDescription)
                }
            }
        }
        .resume()
    }
    
}

