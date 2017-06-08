//
//  ViewController.swift
//  digitalShop
//
//  Created by Andrew Foster on 6/7/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product] = Product.createProducts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell") as? ShopCell {
            
            let product = products[indexPath.row]
            
            cell.titleLbl.text = product.name
            cell.priceLbl.text = product.price
            cell.productImage.image = product.image
            
            return cell
        }
        return ShopCell()
    }


}

