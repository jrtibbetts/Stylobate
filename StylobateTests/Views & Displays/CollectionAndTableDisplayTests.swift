//
//  CollectionAndTableDisplayTests.swift
//  StylobateTests
//
//  Created by Jason R Tibbetts on 7/21/18.
//  Copyright © 2018 Poikile Creations. All rights reserved.
//

@testable import Stylobate
import XCTest

class CollectionAndTableDisplayTests: XCTestCase {

    let nib = UINib(nibName: "CollectionAndTableDisplayTests",
                    bundle: Bundle(for: CollectionAndTableDisplayTests.self))

    var collectionAndTableView: CollectionAndTableDisplay {
        // Get a new instance every time. Tests should grab it once only.
        return nib.instantiate(withOwner: nil, options: nil)[0] as! CollectionAndTableDisplay
    }

    var collectionOnlyView: CollectionAndTableDisplay {
        // Get a new instance every time. Tests should grab it once only.
        return nib.instantiate(withOwner: nil, options: nil)[1] as! CollectionAndTableDisplay
    }

    var tableOnlyView: CollectionAndTableDisplay {
        // Get a new instance every time. Tests should grab it once only.
        return nib.instantiate(withOwner: nil, options: nil)[2] as! CollectionAndTableDisplay
    }

    var noOutletsView: CollectionAndTableDisplay {
        // Get a new instance every time. Tests should grab it once only.
        return nib.instantiate(withOwner: nil, options: nil)[3] as! CollectionAndTableDisplay
    }

    // MARK: - Collection and Table

    func testCollectionAndTableInitialForegroundModeIsTable() {
        let view = collectionAndTableView
        XCTAssertEqual(view.foregroundMode, .table)
        XCTAssertNotNil(view.foregroundView)

        XCTAssertTrue(view.foregroundView === view.tableView)
        XCTAssertNil(view.indexPathForSelectedItem)
        XCTAssertNil(view.indexPathsForSelectedItems)
    }

    func testCollectionAndTableViewToggleForegroundPutsCollectionInForeground() {
        let view = collectionAndTableView
        view.toggleForegroundView()
        XCTAssertEqual(view.foregroundMode, .collection)
        XCTAssertTrue(view.foregroundView === view.collectionView)
    }

    func testCollectionAndTableViewToggleForegroundTwicePutsTableInForeground() {
        let view = collectionAndTableView
        view.toggleForegroundView()
        assert(shown: view.collectionView!, hidden: view.tableView!)

        view.toggleForegroundView()
        XCTAssertEqual(view.foregroundMode, .table)
        XCTAssertTrue(view.foregroundView === view.tableView)
        assert(shown: view.tableView!, hidden: view.collectionView!)
    }

    func testCollectionAndTableViewSetForegroundModeShowsAndHides() {
        let view = collectionAndTableView

        view.foregroundMode = .collection
        assert(shown: view.collectionView!, hidden: view.tableView!)

        view.foregroundMode = .table
        assert(shown: view.tableView!, hidden: view.collectionView!)
    }

    // MARK: - Collection Only

    func testCollectionOnlyInitialForegroundModeIsCollection() {
        let view = collectionOnlyView
        XCTAssertEqual(view.foregroundMode, .collection)
        XCTAssertNotNil(view.foregroundView)
        XCTAssertTrue(view.foregroundView === view.collectionView)
        XCTAssertNil(view.indexPathForSelectedItem)
        XCTAssertNotNil(view.indexPathsForSelectedItems)
        XCTAssertTrue(view.indexPathsForSelectedItems!.isEmpty)
        XCTAssertFalse(view.collectionView!.isHidden)
    }

    func testCollectionOnlyViewToggleForegroundChangesNothing() {
        let view = collectionOnlyView
        view.toggleForegroundView()
        XCTAssertEqual(view.foregroundMode, .collection)
        XCTAssertTrue(view.foregroundView === view.collectionView)
        XCTAssertFalse(view.collectionView!.isHidden)
    }

    func testCollectionOnlyViewSetForegroundModeDoesNothing() {
        let view = collectionOnlyView

        view.foregroundMode = .collection
        XCTAssertEqual(view.foregroundMode, .collection)
        XCTAssertFalse(view.collectionView!.isHidden)

        view.foregroundMode = .table
        XCTAssertEqual(view.foregroundMode, .collection)
        XCTAssertFalse(view.collectionView!.isHidden)
    }

    // MARK: - Table Only

    func testTableOnlyInitialForegroundModeIsTable() {
        let view = tableOnlyView
        XCTAssertEqual(view.foregroundMode, .table)
        XCTAssertNotNil(view.foregroundView)
        XCTAssertTrue(view.foregroundView === view.tableView)
        XCTAssertNil(view.indexPathForSelectedItem)
        XCTAssertNil(view.indexPathsForSelectedItems)
        XCTAssertFalse(view.tableView!.isHidden)
    }

    func testTableOnlyToggleForegroundChangesNothing() {
        let view = tableOnlyView
        view.toggleForegroundView()
        XCTAssertEqual(view.foregroundMode, .table)
        XCTAssertTrue(view.foregroundView === view.tableView)
        XCTAssertFalse(view.tableView!.isHidden)
    }

    func testTableOnlyViewSetForegroundModeDoesNothing() {
        let view = tableOnlyView

        view.foregroundMode = .collection
        XCTAssertEqual(view.foregroundMode, .table)
        XCTAssertFalse(view.tableView!.isHidden)

        view.foregroundMode = .table
        XCTAssertEqual(view.foregroundMode, .table)
        XCTAssertFalse(view.tableView!.isHidden)
    }

    func testNoOutletViewHasTableForegroundModeAndNilSelectedIndices() {
        let view = noOutletsView
        XCTAssertEqual(view.foregroundMode, .table)
        XCTAssertNil(view.indexPathForSelectedItem)
        XCTAssertNil(view.indexPathsForSelectedItems)
    }

    // MARK: - Fixtures

    func assert(shown: UIView, hidden: UIView) {
        XCTAssertFalse(shown.isHidden)
        XCTAssertTrue(hidden.isHidden)
    }

}
