//
//  NormalItem.swift
//  
//
//  Created by Mauro Bianchelli on 2024-06-07.
//

import Foundation

/// An `Item` that decreases its quality twice as fast, if the sell by date has passed.
///
class NormalItem: Item, Updatable {

    func update() {
        reduceSellIn()
        
        reduceRange.forEach { _ in
            reduceQuality()
        }
    }

    private var reduceRange: ClosedRange<Int> {
        if isExpired {
            return 1...2
        }
        return 1...1
    }
}
