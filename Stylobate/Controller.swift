//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

/// A `UIViewController` that has outlets to a `Model` and a `Display`, and
/// connects them when the view is loaded.
public protocol Controller: class {

    var model: Model? { get set }

    var display: Display? { get set }

}

open class OutlettedController: UIViewController, Controller {

    /// The `Model` object. Note that this requires the model to be set as the
    /// class type of a custom Object in the storyboard,
    @IBOutlet open weak var model: Model?

    @IBOutlet open weak var display: Display?

    // MARK: UIViewController

    open override func viewDidLoad() {
        super.viewDidLoad()

        if model == nil {
            assertionFailure("The model can't be nil when viewDidLoad() is called.")
        }

        if display == nil {
            assertionFailure("The display can't be nil when viewDidLoad() is called.")
        }

        display?.model = model
    }

}
