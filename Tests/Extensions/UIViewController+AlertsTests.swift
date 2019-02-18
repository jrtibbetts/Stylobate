//  Copyright © 2018 Poikile Creations. All rights reserved.

import XCTest

class UIViewController_AlertsTests: XCTestCase {

    func testPresentAlertWithNoMessageOk() {
        let error = NSError(domain: "StylobateTests", code: 0, userInfo: nil)
        let message: String? = nil
        TestUtil.goodViewController.presentAlert(for: error, title: message)
    }
    
}