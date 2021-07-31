//  Copyright © 2019 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

class TimeIntervalExtensionsTests: XCTestCase {

    func test14DaysIs2Weeks() {
        XCTAssertEqual(14.days, 2.weeks)
    }

    func test2YearsIs104WeeksAndTwoDays() {
        XCTAssertEqual(2.years, 104.weeks + 2.days)
    }

    // MARK: - durationString

    func testFormattedStringDropsHours() {
        let timeInterval = 165.0000 // 2:45
        let durationString = timeInterval.formattedString
        XCTAssertEqual(durationString, "2:45")
    }

    func testFormattedStringIncludesHours() {
        let timeInterval = (3.0 * 60.0 * 60.0) + 165.0000 // 3:02:45
        let durationString = timeInterval.formattedString
        XCTAssertEqual(durationString, "3:02:45")
    }

    func testFormattedStringHandlesNegativeValues() {
        let timeInterval = -165.0000 // -2:45
        let durationString = timeInterval.formattedString
        XCTAssertEqual(durationString, "-2:45")
    }

}
