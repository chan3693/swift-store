//
//  OwnedItem.swift
//  Group8_Store
//
//  Created by Hao Wu on 2024-05-20.
//

import Foundation
class OwnedItem : Item {
    var minutesUsed : Int
    
    init(minutesUsed: Int = 0, id: Int, title: String, price: Double) {
        self.minutesUsed = minutesUsed
        super.init(id: id, title: title, price: price)
    }
}
