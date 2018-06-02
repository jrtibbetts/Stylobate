//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

class ControllerTests: XCTestCase {

    let testStoryboard = UIStoryboard(name: "Main", bundle: Bundle(for: ControllerTests.self))

    func testBadControllerFailsAssertion() {
        let controller = testStoryboard.instantiateViewController(withIdentifier: "badOutlettedController") as! OutlettedController
        _ = controller.view

        XCTAssertNil(controller.model, "controller model")
        XCTAssertNil(controller.display, "controller display")
    }

    func testGoodControllerHasValidModelAndDisplay() {
        let controller = testStoryboard.instantiateViewController(withIdentifier: "goodOutlettedController") as! OutlettedController
        _ = controller.view

        XCTAssertNotNil(controller.model, "controller model")
        XCTAssertNotNil(controller.display, "controller display")
        XCTAssertTrue(controller.display?.model === controller.model, "display model and controller model")
    }

}
