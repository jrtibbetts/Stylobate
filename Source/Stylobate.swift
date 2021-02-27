//  Created by Jason R Tibbetts on 2/14/21.

import Foundation

public class Stylobate {

    /// Looks in three potential places for a resource bundle of a specified
    /// name, and returns the first one it finds, or fatally errors out if none
    /// are found.
    ///
    /// Location | Note
    /// --- | ---
    /// `Bundle.main.resourceURL` | If the bundle was built using an Xcode project
    /// `sourceBundle.resourceURL` | If it was built using Swift Package Manager
    /// `Bundle.main.bundleURL` | ?
    public static func resourceBundle(named resourceBundleName: String,
                                      sourceBundle: Bundle) -> Bundle {
        let locationCandidates = [Bundle.main.resourceURL,
                                  sourceBundle.resourceURL,
                                  Bundle.main.bundleURL]

        for path in locationCandidates {
            if let bundleUrl = path?.appendingPathComponent(resourceBundleName + ".bundle"),
               let bundle = Bundle(url: bundleUrl) {
                return bundle
            }
        }

        return sourceBundle  // For targets in a .pbxproj
    }

    public static var resourceBundle: Bundle = Stylobate.resourceBundle(named: "Stylobate_Stylobate", sourceBundle: Bundle(for: Stylobate.self))

}
