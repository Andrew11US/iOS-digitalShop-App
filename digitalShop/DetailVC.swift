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
    
    func allTheSummaryItems(_ shippingMethod:PKShippingMethod) -> [PKPaymentSummaryItem] {
        let product = PKPaymentSummaryItem(label: self.product.name, amount: NSDecimalNumber(string: self.product.price))
        let shipping = PKPaymentSummaryItem(label: shippingMethod.label, amount: shippingMethod.amount)
        let total = PKPaymentSummaryItem(label: "DigitalShop", amount: product.amount.adding(shipping.amount))
        return [product, shipping, total]
    }
    
    func applePayTapped() {
        let request = PKPaymentRequest()
        request.supportedNetworks = [PKPaymentNetwork.amex, PKPaymentNetwork.visa, PKPaymentNetwork.masterCard, PKPaymentNetwork.discover, PKPaymentNetwork.chinaUnionPay]
        request.countryCode = "US"
        request.currencyCode = "USD"
        request.merchantIdentifier = "merchant.com.losAngelesBoy.digitalShop"
        request.merchantCapabilities = .capability3DS
        
        request.requiredShippingAddressFields = .email
        
        let freeShipping = PKShippingMethod(label: "Free Shipping", amount: NSDecimalNumber(value: 0.0 as Double))
        freeShipping.identifier = "freeShipping"
        freeShipping.detail = "Usually ships in 5-12 days"
        
        let expressShipping = PKShippingMethod(label: "Express Shipping", amount: NSDecimalNumber(value: 5.49 as Double))
        expressShipping.identifier = "expressShipping"
        expressShipping.detail = "Usually ships in 2-3 days"
        
        let overNightShipping = PKShippingMethod(label: "Overnight Shipping", amount: NSDecimalNumber(value: 13.99 as Double))
        overNightShipping.identifier = "overnightShipping"
        overNightShipping.detail = "Usually ships in 1 day"
        
        request.shippingMethods = [freeShipping, expressShipping, overNightShipping]
        
        request.paymentSummaryItems = allTheSummaryItems(freeShipping)
        
        let applePayContoller = PKPaymentAuthorizationViewController(paymentRequest: request)
//        applePayContoller.delegate = self
        self.present(applePayContoller, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let thankYouVC = segue.destination as? ThankYouVC {
            if sender != nil {
                if let email = sender as? String {
                    thankYouVC.email = email
                }
            }
        }
    }

}
