//
//  NormalItem.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-07.
//

import Foundation

/// An `Item` that decreases its quality twice as fast, if the sell by date has passed.
///
class NormalItem: ItemProtocol {

    struct Const {
        static let expiredReductionRange = Self.notExpiredReductionRange * 2
        static let notExpiredReductionRange = 1
    }

    init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }

    var name: String
    var sellIn: Int
    var quality: Int
}

extension ItemProtocol where Self == NormalItem {
    private var reductionRange: Int {
        isExpired ? NormalItem.Const.expiredReductionRange : NormalItem.Const.notExpiredReductionRange
    }

    func update() {
        sellIn -= 1
        for _ in 0...reductionRange {
            guard canReduceQuality else { break }
            quality -= 1
        }
    }
}
