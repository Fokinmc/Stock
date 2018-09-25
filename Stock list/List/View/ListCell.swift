//
//  ListCell.swift
//  Stock list
//
//  Created by Mac on 24.09.2018.
//  Copyright © 2018 FokinMC. All rights reserved.
//

import UIKit


class ListCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var amount: UILabel!

    
    func configure(with stock: Current) {
        
        let amount = stock.price.amount
        let roundAmount = NSString(format: "%.2f", Double(round(100*amount)/100))
        
        self.name.text = stock.name
        self.volume.text = "\(stock.volume)"
        self.amount.text = "\(roundAmount)"
    }
}
