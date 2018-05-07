//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

class CollectionAndTableModelTests: XCTestCase {
    
    func testCollectionViewReturnsExpectedValues() {
        let model = CollectionAndTableModel()
        let path = IndexPath(item: 0, section: 0)
        let collectionView = UICollectionView(frame: CGRect(),
                                              collectionViewLayout: UICollectionViewFlowLayout())
        let cell = model.collectionView(collectionView, cellForItemAt: path)
        XCTAssertTrue(cell.isMember(of: MissingCollectionViewCell.self))
        XCTAssertEqual(model.numberOfSections(in: collectionView), 0)
        XCTAssertEqual(model.collectionView(collectionView, numberOfItemsInSection: 0), 0)
    }

    func testTableViewReturnsExpectedValues() {
        let model = CollectionAndTableModel()
        let path = IndexPath(item: 0, section: 0)
        let tableView = UITableView(frame: CGRect())
        let cell = model.tableView(tableView, cellForRowAt: path)
        XCTAssertTrue(cell.isMember(of: MissingTableViewCell.self))
        XCTAssertEqual(model.numberOfSections(in: tableView), 0)
        XCTAssertEqual(model.tableView(tableView, numberOfRowsInSection: 0), 0)
    }

}
