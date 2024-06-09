//
//  AgedBrieTests.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-09.
//

@testable import GildedRose
import XCTest

class AgedBrieTests: XCTestCase {

    func testUpdateQuality_AgedBrie_IncreaseQuality() {
        let item = AgedBrie(name: "Aged Brie", sellIn: 2, quality: 2)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 3)
    }

    func testUpdateQuality_AgedBrie_QualityEqualFifty() {
        let item = AgedBrie(name: "Aged Brie", sellIn: 0, quality: 50)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 50)
    }
}

