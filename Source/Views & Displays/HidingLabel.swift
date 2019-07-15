//  Copyright © 2019 Poikile Creations. All rights reserved.

import UIKit

@IBDesignable open class HidingLabel: UILabel {

    // MARK: - Typealiases

    public typealias TextHidingPredicate = (String?) -> Bool

    public typealias AttributeTextHidingPredicate = (NSAttributedString?) -> Bool

    // MARK: - Properties

    open var shouldHideAttributedText: AttributeTextHidingPredicate = { (attributedString) in
        return attributedString == nil || attributedString?.string.isEmpty ?? false
    }

    open var shouldHideText: TextHidingPredicate = { (string) in
        return string == nil || string?.isEmpty ?? false
    }

    open func hideIfMatchesPredicates() {
        isHidden = shouldHideText(text) && shouldHideAttributedText(attributedText)
    }

    // MARK: - UILabel

    open override var attributedText: NSAttributedString? {
        didSet {
            hideIfMatchesPredicates()
        }
    }

    open override var text: String? {
        didSet {
            hideIfMatchesPredicates()
        }
    }

}
