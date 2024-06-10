//
//  GildedRoseUpdating.swift
//  
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation

public protocol GildedRoseUpdating: AnyObject {
    var items: [Itemable] { get }
    func updateQualityAndReport() throws -> String
}
