//
//  UInt8+quality.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-09.
//

import Foundation

/// This is not the best solution, but since the `Item` class cant be modified (for example to use a range instead of an integer) it is a workaround.
public extension UInt8 {
    var qualityBoundsChecker: Self {
        if self >= 50 {
            return 50
        }
        if self <= 0 {
            return 0
        }
        return self
    }
}
