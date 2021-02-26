//  Copyright © 2019 Poikile Creations. All rights reserved.

#if os(iOS) || os(tvOS)

import UIKit

open class CollectionAndTableViewController: UIViewController, Controller {

    open var model: CollectionAndTableModel?

    open var display: Display? {
        return view as? CollectionAndTableDisplay
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        (display as? CollectionAndTableDisplay)?.model = model
    }

}

#endif
