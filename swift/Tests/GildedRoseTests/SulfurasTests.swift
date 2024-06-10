//
//  SulfurasTests.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

@testable import GildedRose
import XCTest

class SulfurasTests: XCTestCase {

    func testUpdateQuality_Sulfuras_updateQuality() {
        let item = Sulfuras(name: "Sulfuras", sellIn: 2)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, 2)
        XCTAssertEqual(item.quality, 80)
    }
}

