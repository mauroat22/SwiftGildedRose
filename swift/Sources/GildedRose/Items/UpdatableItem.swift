//
//  UpdatableItem.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation

public class UpdatableItem: ItemProtocol, Updatable {
    public var name: String
    public var sellIn: Int
    public var quality: Int

    init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality.qualityBoundsChecked
    }

    func update() {
        sellIn -= 1
    }
}
