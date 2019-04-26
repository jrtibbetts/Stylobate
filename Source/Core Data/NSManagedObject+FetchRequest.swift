//  Copyright © 2019 Poikile Creations. All rights reserved.

import CoreData
import Foundation

extension NSManagedObject {

    class func fetchRequest<T: NSManagedObject>(sortDescriptors: [NSSortDescriptor],
                                                predicate: NSPredicate?) -> NSFetchRequest<T> {
        let request = self.fetchRequest() as! NSFetchRequest<T>
        request.sortDescriptors = sortDescriptors
        request.predicate = predicate

        return request
    }

}
