//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

public extension UIView {

    // MARK: - Private Functions

    public func banish(_ subview: UIView?) {
        if let subview = subview {
            subview.isHidden = true
            sendSubviewToBack(subview)
        }
    }

    public func summon(_ subview: UIView?) {
        if let subview = subview {
            bringSubviewToFront(subview)
            subview.isHidden = false
        }
    }

}

