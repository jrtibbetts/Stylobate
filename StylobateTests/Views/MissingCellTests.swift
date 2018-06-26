//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

class MissingCellTests: XCTestCase {

    let nib = UINib(nibName: "MissingCellTests",
                    bundle: Bundle(for: MissingCellTests.self))

    func testMissingTableViewCellAwakeFromNibOk() {
        guard let cell = nib.instantiate(withOwner: nil, options: nil)[0] as? MissingTableViewCell else {
            XCTFail("Expected view 0 in the nib to be a MissingTableViewCell")
            return
        }

        XCTAssertNotNil(cell.textLabel, "text label")

        // Serialize it out and back in.
        let data = NSKeyedArchiver.archivedData(withRootObject: cell)

        guard let copy = NSKeyedUnarchiver.unarchiveObject(with: data) as? MissingTableViewCell else {
            XCTFail("Expected the missing table view cell to be deserialized")
            return
        }

        XCTAssertEqual(cell.textLabel?.text, copy.textLabel?.text)
    }

    func testMissingCollectionViewCellAwakeFromNibOk() {
        guard let cell = nib.instantiate(withOwner: nil, options: nil)[1] as? MissingCollectionViewCell else {
            XCTFail("Expected view 1 in the nib to be a MissingTableViewCell")
            return
        }

        XCTAssertNotNil(cell.textLabel, "text label")

        // Serialize it out and back in.
        let data = NSKeyedArchiver.archivedData(withRootObject: cell)

        guard let copy = NSKeyedUnarchiver.unarchiveObject(with: data) as? MissingCollectionViewCell else {
            XCTFail("Expected the missing collection view cell to be deserialized")
            return
        }

        XCTAssertEqual(cell.textLabel?.text, copy.textLabel?.text)
    }

}
