//  Copyright © 2019 Poikile Creations. All rights reserved.

import Foundation

/// A property wrapper for values stored in `UserDefaults`. Use one by passing
/// in the key to store it with, along with a default value to be returned if
/// the value isn't already in `UserDefaults.standard`.
///
/// ```
/// @UserDefault(key: "captionSize", defaultValue: 24.0)
/// var captionSize: CGFloat
/// ```
///
/// This is mind-blowing.
///
/// @see https://www.avanderlee.com/swift/property-wrappers/
@propertyWrapper
public struct UserDefault<T> {

    let key: String

    let defaultValue: T

    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {

        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }

        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }

    }

}

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
        // This was a one-liner, but breaking it out makes it easier to debug.
        let value = Settings.defaults.value(forKey: key)
        let typedValue = value as? T

        return typedValue ?? defaultValue
    }

    public static func set<T>(_ value: T, forKey key: String) {
        Settings.defaults.set(value, forKey: key)
    }

}
