//  Copyright © 2019 Poikile Creations. All rights reserved.

@testable import Stylobate
import CoreData
import XCTest

class NSManagedObjectContext_FetchOrCreate: FetchingTestBase {

    // MARK: - fetchOrCreate(with:initialize:)

    func testFetchOrCreateTwiceReturnsSameValue() throws {
        let request = Person.fetchRequest(sortDescriptors: [sortByName],
                                          predicate: NSPredicate(format: "name == \"Frank Abberline\""))

        let person1 = try testingContext.fetchOrCreate(with: request,
                                                       initialize: initializePerson)
        let person2 = try testingContext.fetchOrCreate(with: request,
                                                       initialize: initializePerson)
        XCTAssertTrue(person1 === person2)
    }

    func testFetchOrCreateWithDifferentPredicatesReturnsDifferentValues() throws {
        let request = Person.fetchRequest(sortDescriptors: [sortByName],
                                          predicate: NSPredicate(format: "name == \"Sir William Gull\""))
        let person1 = try testingContext.fetchOrCreate(with: request,
                                                       initialize: initializePerson)
        let person2 = try testingContext.fetchOrCreate(with: request,
                                                       initialize: initializePerson)

        XCTAssertFalse(person1 === person2)
    }

    // MARK: - fetchOrCreate(withRequest:updateWith:)

    func testFetchOrCreateUpdateWithTwiceReturnsSameValue() throws {
        let request: NSFetchRequest<Person> = Person.fetchRequest(sortDescriptors: [sortByName],
                                                                  predicate: NSPredicate(format: "name == \"Frank Abberline\""))

        let person1 = try testingContext.fetchOrCreate(withRequest: request) { (person) in
            person.name = "Frank Abberline"
            person.sortName = "Abberline, Frank"
        }
        let person2 = try testingContext.fetchOrCreate(withRequest: request) { (person) in
            person.name = "Frank Abberline"
            person.sortName = "Abberline, Frank"
        }
        XCTAssertTrue(person1 === person2)
    }

    func testFetchOrCreateUpdateWithDifferentPredicatesReturnsDifferentValues() throws {
        let request: NSFetchRequest<Person> = Person.fetchRequest(sortDescriptors: [sortByName],
                                                                  predicate: NSPredicate(format: "name == \"Sir William Gull\""))
        let person1 = try testingContext.fetchOrCreate(withRequest: request) { (person) in
            person.name = "Frank Abberline"
            person.sortName = "Abberline, Frank"
        }
        let person2 = try testingContext.fetchOrCreate(withRequest: request) { (person) in
            person.name = "Frank Abberline"
            person.sortName = "Abberline, Frank"
        }

        XCTAssertFalse(person1 === person2)
    }

    // MARK: - Utilities

    let sortByName = (\Person.name).sortDescriptor()

    func initializePerson(_ context: NSManagedObjectContext) -> Person {
        let person = Person(context: context)
        updatePerson(person)
        return person
    }

    func updatePerson(_ person: Person) {
        person.name = "Frank Abberline"
        person.sortName = "Abberline, Frank"
    }

}
