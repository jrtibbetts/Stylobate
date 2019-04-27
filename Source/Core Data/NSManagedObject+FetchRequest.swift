//  Copyright © 2019 Poikile Creations. All rights reserved.

import CoreData
import Foundation

public extension NSManagedObject {

    class func all<T: NSManagedObject>(inContext context: NSManagedObjectContext,
                                        sortedBy sortCriteria: [NSSortDescriptor] = []) throws -> [T] {
        return try context.fetch(fetchRequestForAll(sortedBy: sortCriteria))
    }

    class func deleteAll(fromCoordinator coordinator: NSPersistentStoreCoordinator,
                         context: NSManagedObjectContext) throws {
        let allRequest = fetchRequestForAll(sortedBy: [])
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: allRequest as! NSFetchRequest<NSFetchRequestResult>)

        try coordinator.execute(deleteRequest, with: context)
    }

    class func fetchRequest<T: NSManagedObject>(sortDescriptors sortCriteria: [NSSortDescriptor],
                                                predicate: NSPredicate? = nil) -> NSFetchRequest<T> {
        let entityName = String(describing: self)
        let request: NSFetchRequest<T> = NSFetchRequest(entityName: entityName)
        request.sortDescriptors = sortCriteria
        request.predicate = predicate

        return request
    }

    class func fetchRequestForAll<T: NSManagedObject>(sortedBy sortCriteria: [NSSortDescriptor] = []) -> NSFetchRequest<T> {
        return fetchRequest(sortDescriptors: sortCriteria)
    }

}
