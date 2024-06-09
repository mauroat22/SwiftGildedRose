//
//  Conjured.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// An `Item`  that decreases its quality twice as fast as a normal item.
///
class Conjured: ItemProtocol, Updatable {

    struct Const {
        static let expiredReductionRange = Self.notExpiredReductionRange * 2
        static let notExpiredReductionRange = 2
    }

    init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality.qualityBoundsChecked
    }

    var name: String
    var sellIn: Int
    var quality: Int {
        didSet {
            quality = quality.qualityBoundsChecked
        }
    }

    private var reductionRange: Int {
        isExpired ? Conjured.Const.expiredReductionRange : Conjured.Const.notExpiredReductionRange
    }

    func update() {
        sellIn -= 1
        for _ in 1...reductionRange {
            guard canReduceQuality else { break }
            quality -= 1
        }
    }
}
