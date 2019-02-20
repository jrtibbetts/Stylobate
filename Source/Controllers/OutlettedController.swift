//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

/// A `Controller` that implements its `model` and `display` as `weak`
/// `IBOutlet`s. It requires the model and display to be non-`nil` before
/// `viewDidLoad()` is called.
open class OutlettedController: UIViewController, Controller {

    /// The `Model` object. Note that this requires the model to be set as the
    /// class type of a custom Object in the storyboard,
    @IBOutlet open weak var model: Model?

    /// The UI component.
    @IBOutlet open weak var display: Display?

    // MARK: - UIViewController Functions

    open override func viewDidLoad() {
        super.viewDidLoad()

        if model == nil {
            NSLog("The model can't be nil when viewDidLoad() is called.")
        }

        if display == nil {
            NSLog("The display can't be nil when viewDidLoad() is called.")
        }

        display!.model = model!
    }

}
