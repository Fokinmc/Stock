//
//  Spinner.swift
//  Stock list
//
//  Created by Mac on 25.09.2018.
//  Copyright © 2018 FokinMC. All rights reserved.
//

import UIKit

struct Spinner {
    var spinner: UIActivityIndicatorView!

    mutating func spinnerFunc (view: UIView!) {
        spinner = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        spinner.color = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        view.addSubview(spinner)
        
        NSLayoutConstraint(item: spinner, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: spinner, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.97, constant: 1).isActive = true
    }
}
