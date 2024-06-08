//
//  Item+extensions.swift
//  
//
//  Created by Mauro Bianchelli on 2024-06-08.
//

import Foundation

/// Use this extension for adding or decoring `Item` as our rules dictate that Item must not be altered.
/// If this rule changes in the future, consider moving to a polymorphic solution using the `Strategy` pattern, creating a `Quality` object within `Item`.
protocol ItemProtocol {
    var name: String { get set }
    var sellIn: Int { get set }
    var quality: Int { get set }
}

extension Item: ItemProtocol { }

extension ItemProtocol {
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

