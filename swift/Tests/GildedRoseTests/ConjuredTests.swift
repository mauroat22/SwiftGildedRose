//
//  ConjuredTests.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-09.
//

@testable import GildedRose
import XCTest

class ConjuredTests: XCTestCase {

    func testUpdateQuality_Conjured_decreaseQuality() {
        let item = Conjured(name: "Conjured", sellIn: 2, quality: 2)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 0)
    }

    func testUpdateQuality_Conjured_decreaseQualitySellInPassed() {
        let item = Conjured(name: "Conjured", sellIn: -1, quality: 50)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 46)
    }

    func testUpdateQuality_Conjured_decreaseQualitySellInPassed_QualityLessThanFour() {
        let item = Conjured(name: "Conjured", sellIn: -1, quality: 3)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 0)
    }

    func testUpdateQuality_Conjured_decreaseQuality_QualityLessThanTwo() {
        let item = Conjured(name: "Conjured", sellIn: 1, quality: 1)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, 0)
        XCTAssertEqual(item.quality, 0)
    }

}

