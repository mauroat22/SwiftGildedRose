//
//  ItemsRepositoryMock.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation
@testable import GildedRose

class ItemsRepositoryMock: ItemsRepositoryProviding {
    var items: [Itemable] = [
        NormalItem(name: "+5 Dexterity Vest", sellIn: 10, quality: 20)
    ]
}


