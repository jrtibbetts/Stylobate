//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

class ControllerTests: XCTestCase {

    func testGoodControllerHasValidModelAndDisplay() {
        let controller = TestUtil.goodViewController as! OutlettedController
        _ = controller.view

        XCTAssertNotNil(controller.model, "controller model")
        XCTAssertNotNil(controller.display, "controller display")
        XCTAssertTrue(controller.display?.model === controller.model, "display model and controller model")
    }

}
