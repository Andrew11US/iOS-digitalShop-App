//
//  ThankYouVC.swift
//  digitalShop
//
//  Created by Andrew Foster on 6/8/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class ThankYouVC: UIViewController {

    @IBOutlet weak var thankYouLbl: UILabel!
    @IBOutlet weak var conView: UIView!
    
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.thankYouLbl.text = "Your order has been completed and a receipt has been sent to \(self.email). Thank you for your purchase! ☺️"
        
//        let confettiView = SAConfettiView(frame: self.conView.bounds)
//        self.conView.addSubview(confettiView)
//        confettiView.startConfetti()
    }
    
    @IBAction func backTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

}
