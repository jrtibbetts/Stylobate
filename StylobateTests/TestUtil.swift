//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import UIKit

class TestUtil {

    static let storyboard = UIStoryboard(name: "Test",
                                         bundle: Bundle(for: TestUtil.self))

    static let goodViewController: UIViewController
        = storyboard.instantiateViewController(withIdentifier: "goodOutlettedController")

    static let goodController = goodViewController as! OutlettedController

    static let badViewController: UIViewController
        = storyboard.instantiateViewController(withIdentifier: "badOutlettedController")

    static let badController = badViewController as! OutlettedController

}
