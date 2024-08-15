//
//  IsPurchasableProtocol.swift
//  Group8_Store
//
//  Created by Hao Wu on 2024-05-20.
//

import Foundation
protocol IsPurchasable {
    var info : String { get } //a computed property called info
    func printReceipt(isRefund : Bool, amount : Double) //a method called printReceipt(boolean isRefund, double amount)
}
