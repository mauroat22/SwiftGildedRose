//
//  Sulfuras.swift
//  
//
//  Created by Mauro Bianchelli on 2024-06-06.
//

import Foundation

/// Legendary `Item`, never modifies its `sellIn` nor its `quality`, which must be always "80"
///
public class Sulfuras: ItemProtocol {

    struct Const {
        static let constantQuality = 80
    }

    public var name: String
    public var sellIn: Int
    public var quality: Int {
        Sulfuras.Const.constantQuality
    }
    
    public init(name: String, sellIn: Int) {
        self.name = name
        self.sellIn = sellIn
    }
}
