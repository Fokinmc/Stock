//
//  ListNetworkService.swift
//  Stock list
//
//  Created by Mac on 24.09.2018.
//  Copyright © 2018 FokinMC. All rights reserved.
//

import Foundation

class ListNetworkService {
    
    private init() {}
    
    static func getList(completion: @escaping(GetListResponse) -> ()) {
        guard let url = URL(string: "http://phisix-api3.appspot.com/stocks.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error)  in
            do {
                if let data = data {
                    let response = try GetListResponse(data: data)
                    DispatchQueue.main.async {
                        completion(response!)
                    }
                    print("auto udate")
                }
            } catch {
                print(error)
            }
            }.resume()
    }
}
