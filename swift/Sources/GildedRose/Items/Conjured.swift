//
//  Conjured.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// An `Item`  that decreases its quality twice as fast as a normal item.
///
public class Conjured: UpdatableItem {

    struct Const {
        static let expiredReductionRange = Self.notExpiredReductionRange * 2
        static let notExpiredReductionRange = 2
        static let minQuality = 0
    }

    private var reductionRange: Int {
        isExpired ? Conjured.Const.expiredReductionRange : Conjured.Const.notExpiredReductionRange
    }

    override func update() {
        super.update()
        let reductions = min(reductionRange, quality - Const.minQuality)
        quality -= reductions
    }
}
