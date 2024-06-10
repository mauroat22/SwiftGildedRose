//
//  AgedBrie.swift
//  
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// An `Item` that increases in quality as it `sellIn` approaches.
///
class AgedBrie: UpdatableItem {

    override func update() {
        super.update()
        if canIncreaseQuality {
            quality += 1
        }
    }
}
