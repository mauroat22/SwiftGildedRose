//
//  Updatable.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-08.
//

import Foundation

///// Use this protocol to update your custom item's `quality` and/or `sellIn`.
/////
///// `Updatable` allows a polymorphic solution for updating `Item` subclasses.
protocol Updatable {
    func update()
}
