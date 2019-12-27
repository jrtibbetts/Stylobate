//  Copyright © 2019 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

extension Settings {

    static var booleanProperty: Bool {
        get {
            return get(key: "someBooleanProperty", defaultValue: false)
        }

        set {
            set(newValue, forKey: "someBooleanProperty")
        }
    }

    static var intProperty: Int {
        get {
            return get(key: "someIntProperty", defaultValue: 1564)
        }

        set {
            set(newValue, forKey: "someIntProperty")
        }
    }

}

class SettingsTests: XCTestCase {

    override func setUp() {
        // Ensure that we're getting a brand new UserDefaults object every
        // time. If we don't specify a unique suiteName, we'll get pre-existing
        // defaults, and our tests will fail.
        Settings.defaults = UserDefaults(suiteName: "\(Date.timeIntervalSinceReferenceDate)")!
    }

    func testBooleanSetting() {
        XCTAssertFalse(Settings.booleanProperty)

        // Now set it.
        Settings.booleanProperty = true
        XCTAssertTrue(Settings.booleanProperty)
    }

    func testUnsetIntSettingReturnsDefaultValue() {
        XCTAssertEqual(Settings.intProperty, 1564)

        // Now set it.
        Settings.intProperty = 1616
        XCTAssertEqual(Settings.intProperty, 1616)
    }

}
