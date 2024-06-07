//
//  QualityUpdatable.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// `QualityUpdatable`. Use this protocol to update your custom item's quality. 
///
/// `QualityUpdatable` acts as a wrapper for `Item` objects, allowing for a more polymorphic solution without modifying the `Item` itself,
/// as our rules dictate that Item must not be altered. For more info, see the `Decorator` pattern: https://refactoring.guru/design-patterns/decorator .
/// If this rule changes in the future, consider moving to a polymorphic solution using the `Strategy` pattern, creating a `Quality` object within Item.
protocol QualityUpdatable {
    var item: Item { get }
    func updateQuality()
}

extension QualityUpdatable {
    static var qualityConstraints: ClosedRange<UInt> {
        return 0...50
    }
}
