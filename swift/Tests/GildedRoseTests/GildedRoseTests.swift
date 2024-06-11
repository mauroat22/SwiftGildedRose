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
            \n\n-------- day 0 --------\n\n

              NAME: +5 Dexterity Vest
              DAYS LEFT: 10
              QUALITY: 20
              ________________________

            -------- day 1 --------\n\n

              NAME: +5 Dexterity Vest
              DAYS LEFT: 9
              QUALITY: 19
              ________________________
            """
        )
    }

    func testUpdateAndReport_WithItems_Params() {
        sut = GildedRose(items: itemsRepositoryMock.items, commandLineProvider: CommandLineProviderOneDayMock())
        let result = try! sut.updateQualityAndReport()
        XCTAssertEqual(
            result,
            """
            \n\n-------- day 0 --------\n\n

              NAME: +5 Dexterity Vest
              DAYS LEFT: 10
              QUALITY: 20
              ________________________
            """
        )
    }

    func testStartReport_WithoutItems() {
        let sut = GildedRose(items: [], commandLineProvider: CommandLineProviderErrorMock())
        XCTAssertThrowsError(try sut.updateQualityAndReport())
    }

    func testUpdateAndReport_CheckDayIsReported() {
        sut = GildedRose(items: itemsRepositoryMock.items, commandLineProvider: CommandLineProviderOneDayMock())
        let result = try! sut.updateQualityAndReport()
        let dayToCheck = try! CommandLineProviderOneDayMock().getDaysParameter() - 1
        XCTAssert(result.contains("-------- day \(dayToCheck) --------"))
    }

    func testUpdateAndReport_CheckAllItemsAreReported() {
        sut = GildedRose(items: itemsRepositoryMock.items, commandLineProvider: CommandLineProviderOneDayMock())
        let result = try! sut.updateQualityAndReport()
        itemsRepositoryMock.items.forEach { item in
            XCTAssert(result.contains(item.name))
        }
    }

}
