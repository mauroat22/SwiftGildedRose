//
//  BackstagePasses.swift
//  
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// An `Item` that increases in quality as it `sellIn` approaches..
///
class BackstagePasses: Item, Updatable {

    //Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
    //Quality drops to 0 after the concert
    func update() {
        reduceSellIn()

        repetitionRange.forEach { _ in
            increaseQuality()
        }
    }
}

//TODO: Check implementation, the logic is not as this one.
extension BackstagePasses {
    var repetitionRange: ClosedRange<Int> {
        if sellIn > 5 && sellIn <= 10 {
            return 1...2
        } else if sellIn <= 5 {
            return 1...3
        } else if sellIn <= 0 {
            return 1...1
        }

        return 1...1
    }

}
