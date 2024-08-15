//
//  Store.swift
//  Group8_Store
//
//  Created by Hao Wu on 2024-05-20.
//

import Foundation
class Store{
    var items : [Item] = []
    
    func buyItem(c:Customer, itemId:Int) throws {
        guard let item = items.first(where: { $0.id == itemId}) else {
            throw StoreError.itemNotFound //Display an error message item can not be found in store
        }
        if c.balance < item.price{
            throw StoreError.insufficientFunds //The customer does NOT have enough money to buy the item
            
        }else if c.itemsList.contains(where: {$0.id == itemId}){
            throw StoreError.alreadyOwned //The customer ALREADY owns a copy of the item
            
        }else{
            //The price of the game is deducted from the customer balance
            c.balance -= item.price
            //The function creates a new OwnedItem object. The properties of OwnedItem should match the game that the user wants to buy.
            let newItem:OwnedItem = OwnedItem(id: item.id, title: item.title, price: item.price)
            //This OwnedItem object is added to the Customer’s array of owned items
            c.itemsList.append(newItem)
            print("Purchase success!")
            // Display a receipt for the purchase using the Item’s printReceipt() function.
            item.printReceipt(isRefund: false, amount: item.price)
        }
    }
    
    func issueRefund(c: Customer, itemId: Int) throws {
        guard let item = items.first(where: { $0.id == itemId }) else {
            throw StoreError.itemNotFound //Display an error message item can not be found.
        }
        
        guard let ownedItem = c.itemsList.first(where: { $0.id == itemId }) else {
            throw StoreError.itemNotOwned //Display an error message user does not own the item.
        }
        
        guard ownedItem.minutesUsed < 30 else {
            throw StoreError.refundNotEligible //Display an error message user used more the 30 min so cannot be refunded.
        }
        //Return the price of the item to the user’s balance
        c.balance += item.price
        //Return the price of the item to the user’s balance
        item.printReceipt(isRefund: true, amount: item.price)
        //Remove the item from the customer’s list of owned items
        c.itemsList.removeAll(where: { $0.id == itemId})
    }
    
    func findByTitle(keyword:String){
        //Loops through all the items in the store and outputs the details about any matching items.
        let result = items.filter { $0.title.contains(keyword) }
        
        if result.isEmpty {
            //If no games are found, output an error message: “Sorry, no matching games found”
            print("Sorry, no matching item found")
        } else {
            result.forEach { item in
                if item is Game {
                    //If the matching item is a Game, output the text [GAME], followed by information about the Game.
                    print("[Game] \(item.info)")
                } else if item is Movie {
                    //If the matching item is a Movie, output the text [MOVIE], followed by information about the movie.
                    print("[Movie] \(item.info)")
                }
            }
        }
    }
}

