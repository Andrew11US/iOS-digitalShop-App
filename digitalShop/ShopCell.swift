//
//  ShopCell.swift
//  digitalShop
//
//  Created by Andrew Foster on 6/8/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class ShopCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    func configureCell(product: Product) {
        
        titleLbl.text = product.name
        priceLbl.text = product.price
        productImage.image = product.image
        
    }
    
}
