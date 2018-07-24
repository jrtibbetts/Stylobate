//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

public extension UIView {

    // MARK: - Private Functions

    public func banish(_ subview: UIView?) {
        if let subview = subview {
            subview.isHidden = true
            sendSubview(toBack: subview)
        }
    }

    public func summon(_ subview: UIView?) {
        if let subview = subview {
            bringSubview(toFront: subview)
            subview.isHidden = false
        }
    }

}

