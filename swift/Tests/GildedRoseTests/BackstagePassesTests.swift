//
//  BackstagePassesTests.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

@testable import GildedRose
import XCTest

class BackstagePassesTests: XCTestCase {

    //As the update updates first date, is important to check the case of 11...
    func testUpdateQuality_BackstagePasses_SellAppoachesEqualTen() {
        let item = BackstagePasses(name: "Aged Brie", sellIn: 11, quality: 20)

        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, 10)
        XCTAssertEqual(item.quality, 22)
    }

    //As the update updates first date, is important to check the case of 6...
    func testUpdateQuality_BackstagePasses_SellAppoachesLessThanTen() {
        let item = BackstagePasses(name: "Aged Brie", sellIn: 6, quality: 30)

        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, 5)
        XCTAssertEqual(item.quality, 33)
    }

    func testUpdateQuality_BackstagePasses_SellAppoachesLessThanFive() {
        let item = BackstagePasses(name: "Aged Brie", sellIn: 3, quality: 20)

        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, 2)
        XCTAssertEqual(item.quality, 23)
    }

    func testUpdateQuality_BackstagePasses_SellAppoachesEqualFive() {
        let item = BackstagePasses(name: "Aged Brie", sellIn: 5, quality: 4)

        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, 4)
        XCTAssertEqual(item.quality, 7)
    }

    func testUpdateQuality_BackstagePasses_ConcertDay() {
        let item = BackstagePasses(name: "Aged Brie", sellIn: 1, quality: 4)

        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, 0)
        XCTAssertEqual(item.quality, 7)
    }

    func testUpdateQuality_BackstagePasses_ConcertIsOver() {
        let item = BackstagePasses(name: "Aged Brie", sellIn: 0, quality: 4)

        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 0)
    }
}

