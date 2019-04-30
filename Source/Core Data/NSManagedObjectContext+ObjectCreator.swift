//  Copyright © 2017 Poikile Creations. All rights reserved.

import CoreData
import Foundation

public extension NSManagedObjectContext {

    /// Fetch (using a specified request) or create (using an initialization
    /// block) an `NSManagedObject` subtype.
    ///
    /// - parameter request: The fetch request. This should already have its
    ///   predicate, sort order, and other properties set before it's passed
    ///   in.
    /// - parameter initialize: A block that's called to create a new managed
    ///   object if no matching one was found.
    func fetchOrCreate<T: NSManagedObject>(with request: NSFetchRequest<T>,
                                           initialize: (NSManagedObjectContext) -> T) throws -> T {
        // Fetch.................................or create.
        return try fetch(request).first ?? initialize(self)
    }

    func fetchOrCreate<T: NSManagedObject>(with request: NSFetchRequest<T>,
                                           updateWith update: (T) -> Void) throws -> T {
        // Fetch.................................or create.
        let object = try fetch(request).first ?? T.init(context: self)
        update(object)

        return object
    }

    @available(*, deprecated, renamed: "fetchOrCreate")
    func fetchOrCreateManagedObject<T: NSManagedObject>(with request: NSFetchRequest<T>,
                                                        initialize: (NSManagedObjectContext) -> T) throws -> T {
        return try fetchOrCreate(with: request, initialize: initialize)
    }

}
