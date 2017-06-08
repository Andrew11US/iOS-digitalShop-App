//
//  DetailVC.swift
//  digitalShop
//
//  Created by Andrew Foster on 6/8/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import PassKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var titileLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var applePayView: UIView!
    
    var email: String? = nil
    var product = Product()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titileLbl.text = product.name
        self.priceLbl.text = "$\(product.price)"
        self.productImage.image = product.image
        
        let button: PKPaymentButton
        
        if PKPaymentAuthorizationViewController.canMakePayments() {
            button = PKPaymentButton(type: .buy, style: .black)
        } else {
            button = PKPaymentButton(type: .setUp, style: .black)
        }
        
        self.view.layoutIfNeeded()
        button.addTarget(self, action: #selector(DetailVC.applePayTapped) , for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: self.applePayView.frame.size.width, height: self.applePayView.frame.size.height)
        self.applePayView.addSubview(button)
    }
    
    func applePayTapped() {
        print("ApplePAy Tapped!")
    }

}
