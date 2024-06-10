//
//  NormalItem.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-07.
//

import Foundation

/// An `Item` that decreases its quality twice as fast, if the sell by date has passed.
///
public class NormalItem: UpdatableItem {

    struct Const {
        static let expiredReductionRange = Self.notExpiredReductionRange * 2
        static let notExpiredReductionRange = 1
    }
    
    private var reductionRange: Int {
        isExpired ? NormalItem.Const.expiredReductionRange : NormalItem.Const.notExpiredReductionRange
    }

    override func update() {
        super.update()
        for _ in 1...reductionRange {
            guard canReduceQuality else { break }
            quality -= 1
        }
    }
}
