//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

public extension UIView {
    
    /// Put a subview behind all of its siblings.
    ///
    /// - parameter subview: The view to banish.
    public func banish(_ subview: UIView) {
        subview.isHidden = true
        sendSubviewToBack(subview)
    }
    
    public func summon(_ subview: UIView) {
        bringSubviewToFront(subview)
        subview.isHidden = false
    }
    
}
