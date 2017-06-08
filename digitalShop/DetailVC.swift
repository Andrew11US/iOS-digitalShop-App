//
//  DetailVC.swift
//  digitalShop
//
//  Created by Andrew Foster on 6/8/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var titileLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var product = Product()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titileLbl.text = product.name
        self.priceLbl.text = product.price
        self.productImage.image = product.image
    }

}
