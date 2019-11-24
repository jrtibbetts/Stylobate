//  Copyright © 2019 Poikile Creations. All rights reserved.

import Foundation

/// A useful wrapper for the `UserDefaults`. The `defaults` point to the
/// `UserDefaults.standard` ones, but it can be changed for things like unit
/// testing. To use it in an app, create an extension with the desired
/// properties, and provide a `get` and `set` for each one that calls these
/// utility ones, like
///
///    public static var someSize: CGFloat {
//
///        get {
///            return Settings.get(key: "someSize", defaultValue: 24.0)
///        }
//
///        set {
///            Settings.set(newValue, forKey: "someSize")
///        }
///    }
public struct Settings {

    public static var defaults: UserDefaults = UserDefaults.standard

    public static func get<T>(key: String, defaultValue: T) -> T {
        return Settings.defaults.value(forKey: key) as? T ?? defaultValue
    }

    public static func set<T>(_ value: T, forKey key: String) {
        Settings.defaults.set(value, forKey: key)
    }

}
