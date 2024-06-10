//
//  ItemsRepository.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation

public protocol ItemsRepositoryProviding: AnyObject {
    var items: [Itemable] { get }
}

public class ItemsRepository: ItemsRepositoryProviding {
    public init() { }
    
    public let items: [Itemable] = [
        NormalItem(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
        AgedBrie(name: "Aged Brie", sellIn: 2, quality: 0),
        NormalItem(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
        Sulfuras(name: "Sulfuras, Hand of Ragnaros", sellIn: 0),
        Sulfuras(name: "Sulfuras, Hand of Ragnaros", sellIn: -1),
        BackstagePasses(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
        BackstagePasses(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
        BackstagePasses(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
        Conjured(name: "Conjured Mana Cake", sellIn: 3, quality: 6),
    ]
}
