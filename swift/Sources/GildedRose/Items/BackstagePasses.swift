//
//  BackstagePasses.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// An `Item` that increases in quality as it `sellIn` approaches..
///
class BackstagePasses: UpdatableItem {

    struct Const {
        static let maxDaysToSell = 10
        static let minDaysToSell = 5

        static let maxAdditionRange = 3
        static let mediumAdditionRange = 2
        static let minAdditionRange = 1

        static let zero = 0
    }
    
    private var additionRange: Int {
        if sellIn <= BackstagePasses.Const.minDaysToSell {
            return BackstagePasses.Const.maxAdditionRange
        } else if sellIn <= BackstagePasses.Const.maxDaysToSell {
            return BackstagePasses.Const.mediumAdditionRange
        } else if sellIn <= BackstagePasses.Const.zero {
            return BackstagePasses.Const.zero
        } else {
            return BackstagePasses.Const.minAdditionRange
        }
    }

    override func update() {
        super.update()
        for _ in 1...additionRange {
            guard canIncreaseQuality else { break }
            quality += 1
        }
    }
}
