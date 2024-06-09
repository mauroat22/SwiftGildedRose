//
//  QualityBoundsTests.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-09.
//

@testable import GildedRose
import XCTest

class QualityBoundsTests: XCTestCase {

    var itemsMoreThanFifty: [ItemProtocol]!
    var itemsLessThanZero: [ItemProtocol]!

    override func setUp() {
        super.setUp()
        itemsMoreThanFifty = [
            AgedBrie(name: "test", sellIn: 2, quality: 55),
            BackstagePasses(name: "test", sellIn: 3, quality: 55),
            Conjured(name: "name", sellIn: 22, quality: 55),
            NormalItem(name: "normal", sellIn: 2, quality: 55)
        ]

        itemsLessThanZero = [
            AgedBrie(name: "test", sellIn: 2, quality: -1),
            BackstagePasses(name: "test", sellIn: 3, quality: -1),
            Conjured(name: "name", sellIn: 22, quality: -1),
            NormalItem(name: "normal", sellIn: 2, quality: -1)
        ]
    }

    override func tearDown() {
        super.tearDown()
        itemsLessThanZero = nil
        itemsMoreThanFifty = nil

    }

    func testCreateItem_QualityLessThanZeroInit() {
        itemsLessThanZero.forEach { item in
            XCTAssertEqual(item.quality, 0)
        }
    }

    func testCreateItem_QualityLessThanZero() {
        for index in itemsLessThanZero.indices {
            itemsLessThanZero[index].quality = 63
            XCTAssertEqual(itemsLessThanZero[index].quality, 50)
        }
    }

    func testCreateItem_QualityMoreThanFiftyInit() {
        itemsMoreThanFifty.forEach { item in
            XCTAssertEqual(item.quality, 50)
        }
    }

    func testCreateItem_QualityMoreThanFifty() {
        for index in itemsMoreThanFifty.indices {
            itemsMoreThanFifty[index].quality = 63
            XCTAssertEqual(itemsMoreThanFifty[index].quality, 50)
        }
    }
}

