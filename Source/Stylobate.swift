//  Copyright © 2021 Poikile Creations. All rights reserved.

import Foundation

public class Stylobate {

    /// Looks in three potential places for a resource bundle of a specified
    /// name, and returns the first one it finds, or fatally errors out if none
    /// are found.
    ///
    /// Location | Note
    /// --- | ---
    /// `Bundle.main.resourceURL` | For bundles linked to an app
    /// `sourceBundle.resourceURL` | For bundles linked to a framework
    /// `Bundle.main.bundleURL` | For command-line tool
    ///
    /// - seealso https://www.fabrizioduroni.it/2020/10/19/swift-package-manager-resources.html
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

    public static var resourceBundle: Bundle = Stylobate.resourceBundle(named: "Stylobate_Stylobate",
                                                                        sourceBundle: Bundle(for: Stylobate.self))

}
