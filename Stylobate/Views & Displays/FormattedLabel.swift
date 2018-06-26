//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

/// A `UILabel` that uses its initial `text` value (such as one set in a
/// storyboard) as a `printf()`-style formatter that gets applied to all
/// subsequent text assignments. Attributed strings ignore the format.
@IBDesignable open class FormattedLabel: UILabel {

    // MARK: - UILabel Properties

    open override var text: String? {
        get {
            return super.text
        }

        set {
            if let newValue = newValue, let formatString = formatString {
                super.text = String(format: formatString, newValue)
            } else {
                super.text = newValue
            }
        }
    }

    // MARK: - Internal Properties

    internal var formatString: String?

    // MARK: - UILabel Functions

    open override func didMoveToSuperview() {
        super.didMoveToSuperview()
        formatString = text
    }

}
