//
//  UpdatableItem.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation

public class UpdatableItem: Itemable, Updatable {
    public var name: String
    public var sellIn: Int
    public var quality: UInt8 {
        didSet {
            quality = quality.qualityBoundsChecker
        }
    }

    public init(name: String, sellIn: Int, quality: UInt8) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality.qualityBoundsChecker
    }

    func update() {
        sellIn -= 1
    }
}
