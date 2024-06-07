//
//  Conjured.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// An `Item`  that decreases its quality twice as fast as a normal item.
///
class Conjured: Item, Updatable {

    func update() {
        reduceSellIn()

        reduceRange.forEach { _ in
            reduceQuality()
        }
    }

    private var reduceRange: ClosedRange<Int> {
        if isExpired {
            return 1...4
        }
        return 1...2
    }
}
