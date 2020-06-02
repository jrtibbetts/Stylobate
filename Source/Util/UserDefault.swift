//  Copyright © 2020 Poikile Creations. All rights reserved.

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

