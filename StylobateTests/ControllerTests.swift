//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

class ControllerTests: XCTestCase {

    func testBadControllerFailsAssertion() {
        let controller = TestUtil.badViewController as! OutlettedController
        _ = controller.view

        XCTAssertNil(controller.model, "controller model")
        XCTAssertNil(controller.display, "controller display")
    }

    func testGoodControllerHasValidModelAndDisplay() {
        let controller = TestUtil.goodViewController as! OutlettedController
        _ = controller.view

        XCTAssertNotNil(controller.model, "controller model")
        XCTAssertNotNil(controller.display, "controller display")
        XCTAssertTrue(controller.display?.model === controller.model, "display model and controller model")
    }

}
