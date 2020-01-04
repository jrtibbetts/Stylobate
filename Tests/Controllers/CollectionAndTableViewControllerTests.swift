//  Copyright © 2019 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

// swiftlint:disable force_cast

class CollectionAndTableViewControllerTests: XCTestCase {

    lazy var viewController: CollectionAndTableViewController = {
        let storyboard = UIStoryboard(name: "CollectionAndTableTests", bundle: Bundle(for: type(of: self)))
        let viewController = storyboard.instantiateInitialViewController() as! CollectionAndTableViewController
        viewController.model = CollectionAndTableModel()

        return viewController
    }()

    func testLoadFromStoryboardOk() {
        _ = viewController.view
        let display = viewController.display as! TestCollectionAndTableDisplay
        let initialRefreshCount = display.refreshCount
        display.refresh()
        XCTAssertEqual(display.refreshCount, initialRefreshCount + 1)
    }

}

class TestCollectionAndTableDisplay: CollectionAndTableDisplay {

    var refreshCount = 0

    override func refresh() {
        super.refresh()
        refreshCount += 1
    }

}

// swiftlint:enable force_cast
