//
//  Item.swift
//  Group8_Store
//
//  Created by Hao Wu on 2024-05-20.
//

import Foundation
class Item : IsPurchasable { //Conforms to the IsPurchasable protocol
    var id : Int
    var title : String
    var price : Double
    
    init(id: Int, title: String, price: Double) {
        self.id = id
        self.title = title
        self.price = price
    }
    //Contains the stored properties: id (int), title (string), price (double).
    
    var info: String {
        return "\(title) $\(price)"
    }
    
    func printReceipt(isRefund: Bool, amount: Double) { //A sample receipt for a refund / purchase is generated
        if isRefund == true {
            print("""
            -------------------------
            YOUR RECEIPT
            -------------------------
            We are refunding the purchase of \(title)
            Refund issued.
            Refund amount: $\(amount)
            """)
        } else {
            print("""
            -------------------------
            YOUR RECEIPT
            -------------------------
            Thank you for purchasing \(title)
            Purchase amount: $\(amount)
            """)
        }
    }
}
