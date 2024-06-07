//
//  Item+extensions.swift
//  
//
//  Created by Mauro Bianchelli on 2024-06-08.
//

import Foundation

/// Extending `Item` could be possible(?), as isnt clear,I used `Updatable` instead.
extension Item {

    // According to the AC: "The Quality of an item is never negative" and "is never more than 50"
    private var canReduceQuality: Bool {
        let reductableRange: ClosedRange<Int> = 1...50
        return  reductableRange.contains(quality)
    }

    private var canIncreaseQuality: Bool {
        let sumRange: ClosedRange<Int> = 0...49
        return  sumRange.contains(quality)
    }

    var isExpired: Bool {
        sellIn < 0
    }

    func reduceQuality() {
        if canReduceQuality {
            quality -= 1
        }
    }

    func increaseQuality() {
        if canIncreaseQuality {
            quality += 1
        }
    }

    func reduceSellIn() {
        sellIn -= 1
    }
}

