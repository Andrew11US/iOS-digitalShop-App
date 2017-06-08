//
//  Product.swift
//  digitalShop
//
//  Created by Andrew Foster on 6/8/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import Foundation

class Product {
    
    var name = ""
    var price = ""
    var image = UIImage()
    
    static func createProducts() -> [Product] {
        
        let burger = Product()
        burger.name = "Burger"
        burger.price = "1.99"
        if let burgerImage = UIImage(named: "burger") {
            burger.image = burgerImage
        }
        
        let pizza = Product()
        pizza.name = "Pizza"
        pizza.price = "7.99"
        if let pizzaIamge = UIImage(named: "pizza") {
            pizza.image = pizzaIamge
        }
        
        let menu = Product()
        menu.name = "Menu"
        menu.price = "9.99"
        if let menuImage = UIImage(named: "menu") {
            menu.image = menuImage
        }
        
        let kfc = Product()
        kfc.name = "Pizza"
        kfc.price = "4.99"
        if let kfcIamge = UIImage(named: "kfc") {
            kfc.image = kfcIamge
        }
        
        let starbucks = Product()
        starbucks.name = "Starbucks"
        starbucks.price = "12.99"
        if let starbucksImage = UIImage(named: "starbucks") {
            starbucks.image = starbucksImage
        }
        
        return [burger, pizza, menu, kfc, starbucks]
    }
}
