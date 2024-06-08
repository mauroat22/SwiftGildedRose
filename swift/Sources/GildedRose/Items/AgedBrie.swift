//
//  AgedBrie.swift
//  
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// An `Item` that increases in quality as it `sellIn` approaches.
///
class AgedBrie: ItemProtocol {

    init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }

    var name: String
    var sellIn: Int
    var quality: Int
}

extension ItemProtocol where Self == AgedBrie {
    func update() {
        sellIn -= 1
        if canIncreaseQuality {
            quality += 1
        }
    }
}
