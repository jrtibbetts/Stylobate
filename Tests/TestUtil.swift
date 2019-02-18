//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import UIKit

class TestUtil {

    static let storyboard = UIStoryboard(name: "Test",
                                         bundle: Bundle(for: TestUtil.self))

    static let goodViewController: UIViewController
        = storyboard.instantiateViewController(withIdentifier: "goodOutlettedController")

    static let badViewController: UIViewController
        = storyboard.instantiateViewController(withIdentifier: "badOutlettedController")

    // swiftlint:disable force_cast
    static let goodController = goodViewController as! OutlettedController

    static let badController = badViewController as! OutlettedController
    // swiftlint:enable force_cast

}
