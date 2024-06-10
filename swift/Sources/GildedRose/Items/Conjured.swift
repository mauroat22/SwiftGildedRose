//
//  Conjured.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// An `Item`  that decreases its quality twice as fast as a normal item.
///
class Conjured: UpdatableItem {

    struct Const {
        static let expiredReductionRange = Self.notExpiredReductionRange * 2
        static let notExpiredReductionRange = 2
    }

    private var reductionRange: Int {
        isExpired ? Conjured.Const.expiredReductionRange : Conjured.Const.notExpiredReductionRange
    }

    override func update() {
        super.update()
        for _ in 1...reductionRange {
            guard canReduceQuality else { break }
            quality -= 1
        }
    }
}
