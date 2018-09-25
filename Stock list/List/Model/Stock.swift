//
//  Stock.swift
//  Stock list
//
//  Created by Mac on 24.09.2018.
//  Copyright © 2018 FokinMC. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    var stock: [Current]
}

struct Current: Decodable {
    var name: String
    var price: Price
    var percent_change: Double
    var volume: Int
    var symbol: String
}
struct Price: Decodable {
    var currency: String
    var amount: Double
}
