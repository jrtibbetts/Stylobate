//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

class MissingCellTests: XCTestCase {

    let nib = UINib(nibName: "MissingCellTests",
                    bundle: Bundle(for: MissingCellTests.self))

    func testMissingTableViewCellAwakeFromNibOk() {
        assertMissingCell(atIndex: 0)
    }

    func testMissingCollectionViewCellAwakeFromNibOk() {
        assertMissingCell(atIndex: 1)
    }

    func assertMissingCell(atIndex index: Int,
                           file: StaticString = #file,
                           line: UInt = #line) {
        guard let cell = nib.instantiate(withOwner: nil, options: nil)[index] as? MissingCell else {
            XCTFail("Expected view \(index) in the nib to be a MissingCell", file: file, line: line)
            return
        }

        XCTAssertNotNil(cell.textLabel, "text label")

        // Serialize it out and back in.
        let data = NSKeyedArchiver.archivedData(withRootObject: cell)

        guard let copy = NSKeyedUnarchiver.unarchiveObject(with: data) as? MissingCell else {
            XCTFail("Expected a MissingCell to be deserialized", file: file, line: line)
            return
        }

        XCTAssertEqual(cell.textLabel!.text, copy.textLabel!.text, file: file, line: line)
    }

}
