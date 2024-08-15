//
//  Game.swift
//  Group8_Store
//
//  Created by Hao Wu on 2024-05-20.
//

import Foundation
class Game : Item {
    var publisher : String
    var isMultiplayer : Bool
    
    //The info property overrides the parent’s implementation of the property. Returns the game’s title, price, and publisher, and multiplayer features of the game to the screen
    override var info: String {
        return """
        \(title), $\(price)
        Publisher: \(publisher)
        Is Multiplayer: \(isMultiplayer)
        """
    }
    
    init(publisher: String, isMultiplayer: Bool, id: Int, title: String, price: Double) {
        self.publisher = publisher
        self.isMultiplayer = isMultiplayer
        super.init(id: id, title: title, price: price)
    }
}
