//
//  Customer.swift
//  Group8_Store
//
//  Created by Hao Wu on 2024-05-20.
//

import Foundation
class Customer {
    var itemsList : [OwnedItem] = []
    var balance : Double = 10.0
    
    func reloadAccount(amount : Double) {
        balance += amount //Updates the customer’s balance by the specified amount
    }
    
    //Searches the customer’s list of owned items for an item matching the specified id. If found, increase the number of minutes used by numMinutes. If no item with the specified id is found, then do nothing
    func useItem(id : Int, numMinutes : Int) {
        if let item = itemsList.first(where: { $0.id == id}){
            item.minutesUsed += numMinutes
        }
    }
    
}
