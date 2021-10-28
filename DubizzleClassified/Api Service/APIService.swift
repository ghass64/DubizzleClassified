//
//  APIService.swift
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import Foundation

class APIService: NSObject {

    private let sourceURL = URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer")!
    
    func apiToGetItemsData(completion: @escaping (Items) -> ()) {
        URLSession.shared.dataTask(with: sourceURL) { Data, response, error in
            if let data = Data {
                let jsonDecoder = JSONDecoder()
                let itemsData = try! jsonDecoder.decode(Items.self, from: data)
                completion(itemsData)
            }
        }.resume()
    }
}
