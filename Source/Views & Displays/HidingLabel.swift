//  Copyright © 2019 Poikile Creations. All rights reserved.

import UIKit

/// A `UILabel` that sets its `isHidden` flag to `false` if its `text` or
/// `attributedText` fail to meet certain criteria--by default, these criteria
/// are
///  - if both are `nil`, and
///  - if both are empty strings (but _not_ strings consisting only of
///    whitespace)
///
/// The `shouldHideAttributedText` and `shouldHideText` properties can be set
/// to some other predicates, if desired.
@IBDesignable open class HidingLabel: UILabel {

    // MARK: - Typealiases

    public typealias AttributeTextHidingPredicate = (NSAttributedString?) -> Bool

    public typealias TextHidingPredicate = (String?) -> Bool

    // MARK: - Properties

    /// The predicate that determines whether the `attri
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
