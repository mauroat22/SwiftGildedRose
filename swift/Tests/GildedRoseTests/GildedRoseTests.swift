//
//  GildedRoseTests.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation
import XCTest
@testable import GildedRose

class GildedRoseTests: XCTestCase {

    var itemsRepositoryMock: ItemsRepositoryMock!
    var sut: GildedRoseUpdating!

    override func setUp() {
        super.setUp()
        itemsRepositoryMock = ItemsRepositoryMock()
    }

    override func tearDown() {
        itemsRepositoryMock = nil
        sut = nil
        super.tearDown()
    }

    func testUpdateAndReport_WithItems_NoParams() {
        sut = GildedRose(items: itemsRepositoryMock.items, commandLineProvider: CommandLineProviderNoParamMock())
        let result = try! sut.updateQualityAndReport()
        XCTAssertEqual(
            result,
            """
            \n\n-------- day 0 --------\n\n  NAME: +5 Dexterity Vest\n  DAYS LEFT: 10\n  QUALITY: 20\n  ________________________\n\n-------- day 1 --------\n\n  NAME: +5 Dexterity Vest\n  DAYS LEFT: 9\n  QUALITY: 19\n  ________________________
            """
        )
    }

    func testUpdateAndReport_WithItems_Params() {
        sut = GildedRose(items: itemsRepositoryMock.items, commandLineProvider: CommandLineProviderOneDayMock())
        let result = try! sut.updateQualityAndReport()
        XCTAssertEqual(
            result,
            """
            \n\n-------- day 0 --------\n\n  NAME: +5 Dexterity Vest\n  DAYS LEFT: 10\n  QUALITY: 20\n  ________________________
            """
        )
    }

    func testStartReport_WithoutItems() {
        let sut = GildedRose(items: [], commandLineProvider: CommandLineProviderErrorMock())
        XCTAssertThrowsError(try sut.updateQualityAndReport())
    }
}
