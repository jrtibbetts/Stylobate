//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import UIKit

class TestUtil {

    static let storyboard = UIStoryboard(name: "Test",
                                         bundle: Bundle(for: TestUtil.self))

    static let goodOutlettedViewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "goodOutlettedController")

    static let goodOutlettedController = goodOutlettedViewController as! OutlettedController

    static let badOutlettedViewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "badOutlettedController")

    static let badOutlettedController = badOutlettedViewController as! OutlettedController

}
