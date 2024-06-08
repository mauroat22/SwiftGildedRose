//
//  Sulfuras.swift
//  
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// Legendary `Item`, never modifies its `sellIn` nor its `quality`
///
class Sulfuras: ItemProtocol {

    init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
    
    var name: String
    var sellIn: Int
    var quality: Int
}
