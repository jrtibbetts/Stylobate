//  Copyright © 2021 Poikile Creations. All rights reserved.

@testable import Stylobate
import Foundation
import XCTest

public class StylobateTests: XCTestCase {

    public static var resourceBundle = Stylobate.resourceBundle(named: "Stylobate_StylobateTests",
                                                                sourceBundle: Bundle(for: StylobateTests.self))

    func testStylobateResourceBundle() {
        let stylobateResources = Stylobate.resourceBundle
        XCTAssertNotNil(stylobateResources.url(forResource: "Strings", withExtension: "strings"))
    }

}
