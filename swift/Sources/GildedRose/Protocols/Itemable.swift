//
//  Itemable.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation

/// Use this protocol to conform the properties of an `Item`.
///
public protocol Itemable {
    var name: String { get }
    var sellIn: Int { get }
    var quality: UInt8 { get }
}
