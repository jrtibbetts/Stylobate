//  Copyright © 2020 Poikile Creations. All rights reserved.

import Foundation

/// A property wrapper for values stored in `UserDefaults`. To use one,
/// declare the property with the wrapper like so:
///
/// ```swift
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

    public var wrappedValue: T {

        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }

        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }

    }

}
