//  Copyright © 2019 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

extension Settings {

    @UserDefault(key: "someBooleanProperty", defaultValue: false)
    static var booleanProperty: Bool

    @UserDefault(key: "someIntProperty", defaultValue: 1564)
    static var intProperty: Int
}

class SettingsTests: XCTestCase {

    override func setUp() async throws {
        try await super.setUp()
        Settings.defaults = UserDefaults(suiteName: #file)!
    }

    func testGetSet() {
        let testString = "testString"
        Settings.set(testString, forKey: "key")
        XCTAssertEqual(Settings.get(key: "key", defaultValue: "foo"), testString)
    }

    func testGetSetForMissingValue() {
        XCTAssertEqual(Settings.get(key: "non-existent-key", defaultValue: "foo"), "foo")
    }

    func testBooleanSetting() {
        Settings.booleanProperty = false
        XCTAssertFalse(Settings.booleanProperty)
    }

    func testUnsetIntSettingReturnsDefaultValue() {
        Settings.intProperty = 1616
        XCTAssertEqual(Settings.intProperty, 1616)
    }

}
