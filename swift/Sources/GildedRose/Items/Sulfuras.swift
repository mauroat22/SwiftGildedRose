//
//  Sulfuras.swift
//  
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// Legendary `Item`, never modifies its `sellIn` nor its `quality`, which must be always "80"
///
class Sulfuras: ItemProtocol {

    struct Const {
        static let constantQuality = 80
    }

    var name: String
    var sellIn: Int
    var quality: Int {
        Sulfuras.Const.constantQuality
    }
    
    init(name: String, sellIn: Int) {
        self.name = name
        self.sellIn = sellIn
    }
}
