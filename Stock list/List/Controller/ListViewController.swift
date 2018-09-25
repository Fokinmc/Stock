//
//  ViewController.swift
//  Stock list
//
//  Created by Mac on 24.09.2018.
//  Copyright © 2018 FokinMC. All rights reserved.
//

import UIKit


class ListViewController: BaseViewController {
    
    
    var stocks = [Current]()
    var timer = Timer()
    let timeInterval = 5.0
    var spinner = Spinner()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.spinnerFunc(view: tableView)
        addSlideMenuButton()
        
        getData()
        updateData()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(getData), name: NSNotification.Name("tapped"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func updateData() {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(getData), userInfo: nil, repeats: true)
    }
    @objc func getData() {
        ListNetworkService.getList { (response) in
            self.stocks = response.stocks
            self.tableView.reloadData()
            self.spinner.spinner.stopAnimating()
        }
    }
}



extension ListViewController: UITableViewDelegate {
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCell
        let stock = stocks[indexPath.row]
        cell.configure(with: stock)
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
}
