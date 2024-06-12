//
//  QualityBoundsTests.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-09.
//

@testable import GildedRose
import XCTest

class QualityBoundsTests: XCTestCase {

    var itemsMoreThanFifty: [Itemable]!
    var itemsLessThanZero: [Itemable]!

    override func setUp() {
        super.setUp()
        itemsMoreThanFifty = [
            AgedBrie(name: "test", sellIn: 2, quality: 55),
            BackstagePasses(name: "test", sellIn: 3, quality: 55),
            Conjured(name: "name", sellIn: 22, quality: 55),
            NormalItem(name: "normal", sellIn: 2, quality: 55)
        ]
    }

    override func tearDown() {
        super.tearDown()
        itemsMoreThanFifty = nil

    }

    func testCreateItem_QualityMoreThanFiftyInit() {
        itemsMoreThanFifty.forEach { item in
            XCTAssertEqual(item.quality, 50)
        }
    }

    func testCreateItem_QualityMoreThanFiftySet() {
        let item = UpdatableItem(name: "aged brie", sellIn: 30, quality: 20)
        item.quality = 55

        XCTAssertEqual(item.quality, 50)
    }
}

