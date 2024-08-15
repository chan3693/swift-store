//
//  Movie.swift
//  Group8_Store
//
//  Created by Hao Wu on 2024-05-20.
//

import Foundation
class Movie : Item {
    var runningTime : Int
    
    //The info property overrides the parent’s implementation of the property. Returns the name price and running time of the movie
    override var info: String{
        """
        \(title), $\(price)
        Running Time: \(runningTime) min
        """
    }
    
    init(runningTime: Int, id: Int, title: String, price: Double) {
        self.runningTime = runningTime
        super.init(id: id, title: title, price: price)
    }
}
