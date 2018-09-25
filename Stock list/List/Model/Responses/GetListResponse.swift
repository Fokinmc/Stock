//
//  GetListResponse.swift
//  Stock list
//
//  Created by Mac on 24.09.2018.
//  Copyright © 2018 FokinMC. All rights reserved.


import Foundation

struct GetListResponse {
    let stocks: [Current]
    
    init?(data: Data) throws  {
        let list = try JSONDecoder().decode(Stock.self, from: data)
        self.stocks = list.stock
    }
}

