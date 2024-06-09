@testable import GildedRose
import XCTest

class NormalItemTests: XCTestCase {

    func testUpdateQuality_NormalItem_QualityEqualZero() {
        let item = NormalItem(name: "Normal Item", sellIn: 5, quality: 0)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, 4)
        XCTAssertEqual(item.quality, 0)

    }

    func testUpdateQuality_NormalItem_QualityAndSellInDecreaseByOne() {
        let item = NormalItem(name: "Normal Item", sellIn: 15, quality: 11)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, 14)
        XCTAssertEqual(item.quality, 10)
    }

    func testUpdateQuality_NormalItem_SellInDatePassed() {
        let item = NormalItem(name: "Normal Item", sellIn: -1, quality: 11)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 9)
    }

    func testUpdateQuality_NormalItem_SellInDatePassed_QualityZero() {
        let item = NormalItem(name: "Normal Item", sellIn: -1, quality: 0)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 0)
    }

    //Expected to decrease twice as fast, but only 1 is possible.
    func testUpdateQuality_NormalItem_SellInDatePassed_QualityOne() {
        let item = NormalItem(name: "Normal Item", sellIn: -1, quality: 1)
        let sut = GildedRose(items: [item])

        sut.updateQuality()

        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 0)
    }
}
