//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

/// A `UIViewController` that has outlets to a `Model` and a `Display`, and
/// connects them when the view is loaded.
public protocol Controller: class {

    /// The `Model` object.
    var model: Model? { get set }

    /// The `Display` object that controls the UI.
    var display: Display? { get set }

}
