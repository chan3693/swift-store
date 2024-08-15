//
//  StoreError.swift
//  Group8_Store
//
//  Created by Simon Chan on 2024-05-21.
//

import Foundation

enum StoreError: Error {
    case itemNotFound
    case insufficientFunds
    case alreadyOwned
    case refundNotEligible
    case itemNotOwned
}
