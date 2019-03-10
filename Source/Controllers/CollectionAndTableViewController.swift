//  Copyright © 2019 Poikile Creations. All rights reserved.

import UIKit

open class CollectionAndTableViewController: UIViewController, Controller {

    open var model: CollectionAndTableModel?

    open var display: Display<CollectionAndTableModel>? {
        return view as? CollectionAndTableDisplay
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        display?.model = model
    }
    
}
