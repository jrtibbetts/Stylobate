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
            NSLayoutConstraint.constraints(withVisualFormat: "[leadingMargin]-[view]-[trailingMargin]",
                options: NSLayoutFormatOptions.alignAllCenterY,
                metrics: nil,
                views: ["leadingMargin": marginsGuide, "trailingMargin": marginsGuide, "view": self]).forEach { (constraint) in
                    constraint.isActive = true
            }
            centerXAnchor.constraint(equalTo: marginsGuide.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: marginsGuide.centerYAnchor).isActive = true
        }
    }

}
