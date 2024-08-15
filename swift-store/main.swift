//
//  main.swift
//  Group8_Store
//
//  Created by Jacob Lee on 2024-05-20.
//

import Foundation
//1. Creating a customer
let customer1 = Customer() //Creating a customer

//2. Creating a variety of movies and games
let game1 = Game(publisher: "Ironhide Game Studio", isMultiplayer: false, id: 1, title: "Kingdom Rush Origins", price: 19.79)
let game2 = Game(publisher: "Ironhide Game Studio", isMultiplayer: false, id: 3, title: "Heroes: Might and Magic", price: 54.99)
let movie1 = Movie(runningTime: 98, id: 2, title: "Deliverance: The Making of Kingdom Come", price: 6.69)


//3. Creating a store and adding the movies and games to the store
let store1 = Store()
store1.items.append(game1)
store1.items.append(movie1)

print("4. Searching for an item that exists")
print("Search 'Kingdom'")
store1.findByTitle(keyword: "Kingdom")

print("\n5. Searching for an item that does not exist")
print("Search 'ABCDE'")
store1.findByTitle(keyword: "ABCDE")

print("\n6. Trying to purchase an item that cannot afford")
print("Balance: $\(customer1.balance)")
print("Buy \(game1.title), $\(game1.price)")
do {
    try store1.buyItem(c: customer1, itemId: 1)
} catch StoreError.itemNotFound {
    print("Purchase failed: Item not found.")
} catch StoreError.insufficientFunds {
    print("Purchase failed: Does not have enough money.")
} catch StoreError.alreadyOwned {
    print("Purchase failed: Already owns the item.")
}

print("\n7. Reloading the customer’s gift card so have sufficient funds")
customer1.reloadAccount(amount: 40.0)
print("Top up $40.0")
print("Balance: $\(customer1.balance)")

print("\n8. Trying to purchase the same item again (now, they should be able to afford it)")
print("Balance: $\(customer1.balance)")
print("Buy \(game1.title), $\(game1.price)")
do {
    try store1.buyItem(c: customer1, itemId: 1)
} catch StoreError.itemNotFound {
    print("Purchase failed: Item not found.")
} catch StoreError.insufficientFunds {
    print("Purchase failed: Does not have enough money.")
} catch StoreError.alreadyOwned {
    print("Purchase failed: Already owns the item.")
}

print("Balance: $\(customer1.balance)")

print("\n9. Purchasing an item that does not own")
print("Balance: $\(customer1.balance)")
print("Buy \(movie1.title), $\(movie1.price)")
do {
    try store1.buyItem(c: customer1, itemId: 2)
} catch StoreError.itemNotFound {
    print("Purchase failed: Item not found.")
} catch StoreError.insufficientFunds {
    print("Purchase failed: Does not have enough money.")
} catch StoreError.alreadyOwned {
    print("Purchase failed: Already owns the item.")
}
print("Balance: $\(customer1.balance)")

print("\n10. Purchasing an item already owns")
do {
    try store1.buyItem(c: customer1, itemId: 1)
} catch StoreError.itemNotFound {
    print("Purchase failed: Item not found.")
} catch StoreError.insufficientFunds {
    print("Purchase failed: Does not have enough money.")
} catch StoreError.alreadyOwned {
    print("Purchase failed: Already owns the item.")
}

print("\n11. Using one of the items for more than 30 minutes")
print("Played \(game1.title) for 60 minutes")
customer1.useItem(id: 1, numMinutes: 60)

print("\n12. Trying to refund an item that does NOT the refund policy requirements")
do {
    try store1.issueRefund(c: customer1, itemId: 1)
} catch StoreError.itemNotFound {
    print("Refund failed: Item not found.")
} catch StoreError.refundNotEligible {
    print("Refund failed: Used more than 30 minutes.")
} catch StoreError.itemNotOwned {
    print("Refund failed: Item not owned.")
}

print("\n13. Refunding an item that DOES meet the refund policy requirements")
// Using one of the items for less than 30 minutes
print("Watched \(movie1.title) for 10 minutes")
customer1.useItem(id: 2, numMinutes: 10)

// Refunding
do {
    try store1.issueRefund(c: customer1, itemId: 2)
} catch StoreError.itemNotFound {
    print("Refund failed: Item not found.")
} catch StoreError.refundNotEligible {
    print("Refund failed: Used more than 30 minutes.")
} catch StoreError.itemNotOwned {
    print("Refund failed: Item not owned.")
}

print("Balance: $\(customer1.balance)")

print("\n14. Trying to purchase an item that cannot be found in store")
print("Buy \(game2.title)")
do {
    try store1.buyItem(c: customer1, itemId: 3)
} catch StoreError.itemNotFound {
    print("Purchase failed: Item not found.")
} catch (StoreError.insufficientFunds) {
    print("Purchase failed: Does not have enough money.")
} catch (StoreError.alreadyOwned) {
    print("Purchase failed: Already owns the item.")
}
