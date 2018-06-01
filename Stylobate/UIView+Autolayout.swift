//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

public extension UIView {

    /// Add constraints to center the view horizontally and vertically in its
    /// superview. Also add constraints to ensure that this view's frame doesn't
    /// extend past any of the superview's margins.
    public func centerInSuperview() {
        if let superview = superview {
            translatesAutoresizingMaskIntoConstraints = false

            let marginsGuide = superview.layoutMarginsGuide
            centerXAnchor.constraint(equalTo: marginsGuide.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: marginsGuide.centerYAnchor).isActive = true
            leadingAnchor.constraint(greaterThanOrEqualTo: marginsGuide.leadingAnchor).isActive = true
            trailingAnchor.constraint(lessThanOrEqualTo: marginsGuide.trailingAnchor).isActive = true
            topAnchor.constraint(greaterThanOrEqualTo: marginsGuide.topAnchor).isActive = true
            bottomAnchor.constraint(lessThanOrEqualTo: marginsGuide.bottomAnchor).isActive = true
        }
    }

}
