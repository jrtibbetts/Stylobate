//  Copyright © 2017 Poikile Creations. All rights reserved.

@testable import Stylobate
import CoreData
import XCTest

class FetchingTestBase: XCTestCase, ManagedObjectContextContainer {

    override func setUp() {
        super.setUp()
        let model = NSManagedObjectModel.mergedModel(from: [Bundle(for: FetchingTestBase.self)])!
        testingContainer = NSPersistentContainer(name: "StylobateTestModel", managedObjectModel: model)
        try! testingContainer.persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType,
                                                                            configurationName: nil,
                                                                            at: nil,
                                                                            options: nil)
        moContext = testingContext
    }

    var testingContainer: NSPersistentContainer!

    var testingCoordinator: NSPersistentStoreCoordinator! {
        return testingContainer.persistentStoreCoordinator
    }

    var testingContext: NSManagedObjectContext! {
        return testingContainer.viewContext
    }

    var moContext: NSManagedObjectContext?

//    /// An `NSManagedObjectContext` backed by an in-memory store to make it
//    /// suitable for unit testing. Based on an idea by
//    /// https://www.andrewcbancroft.com/2015/01/13/unit-testing-model-layer-core-data-swift/
//    static var testingContext: NSManagedObjectContext = {
//        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//
//        let model = NSManagedObjectModel.mergedModel(from: [Bundle(for: FetchingTestBase.self)])!
//        let stoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
//
//        do {
//            try stoordinator.addPersistentStore(ofType: NSInMemoryStoreType,
//                                                configurationName: nil,
//                                                at: nil,
//                                                options: nil)
//            moc.persistentStoreCoordinator = stoordinator
//        } catch {
//            preconditionFailure("The FetchingTestBase couldn't set up a persistent in-memory store")
//        }
//
//        return moc
//    }()

}
