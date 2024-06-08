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

    init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = Sulfuras.Const.constantQuality
    }
    
    var name: String
    var sellIn: Int
    var quality: Int {
        didSet {
            quality = Sulfuras.Const.constantQuality
        }
    }
}
