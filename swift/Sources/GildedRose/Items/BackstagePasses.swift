//
//  BackstagePasses.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// An `Item` that increases in quality as it `sellIn` approaches..
///
public class BackstagePasses: UpdatableItem {

    struct Const {
        static let maxQuality = 50
        static let maxDaysToSell = 6...10
        static let minDaysToSell = 0...5

        static let maxAdditionRange = 3
        static let mediumAdditionRange = 2
        static let minAdditionRange = 1
    }

    private var additionRange: Int {
        if BackstagePasses.Const.minDaysToSell.contains(sellIn) {
            return BackstagePasses.Const.maxAdditionRange
        }
        if BackstagePasses.Const.maxDaysToSell.contains(sellIn) {
            return BackstagePasses.Const.mediumAdditionRange
        }
        if sellIn < .zero {
            return .zero
        } else {
            return BackstagePasses.Const.minAdditionRange
        }
    }

    override func update() {
        super.update()

        guard additionRange != .zero else {
            quality = 0
            return
        }

        let increments = min(additionRange, Const.maxQuality - quality)
        quality += increments
    }
}
