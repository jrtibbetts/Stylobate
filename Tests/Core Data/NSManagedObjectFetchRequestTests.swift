//
//  NSManagedObject+FetchRequestTests.swift
//  StylobateTests
//
//  Created by Jason R Tibbetts on 4/26/19.
//  Copyright © 2019 Poikile Creations. All rights reserved.
//

import XCTest

class NSManagedObjectFetchRequestTests: FetchingTestBase {

    func testAll() throws {
        importTestData()
        let allPeople: [Person] = try Person.all(inContext: testingContext)
        XCTAssertEqual(allPeople.count, 14)
    }

}
