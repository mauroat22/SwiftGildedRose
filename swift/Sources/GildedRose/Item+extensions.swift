//
//  Item+extensions.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-08.
//

import Foundation

/// Use this protocol to conform the properties of an `Item`.
///
public protocol Itemable {
    var name: String { get }
    var sellIn: Int { get }
    var quality: Int { get }
}

extension Itemable {
    // According to the AC: "The Quality of an item is never negative" and "is never more than 50"
    var canReduceQuality: Bool {
        let reductableRange: ClosedRange<Int> = 1...50
        return  reductableRange.contains(quality)
    }

    var canIncreaseQuality: Bool {
        let sumRange: ClosedRange<Int> = 0...49
        return  sumRange.contains(quality)
    }

    var isExpired: Bool {
        sellIn < 0
    }
}
