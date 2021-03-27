//  Copyright © 2019 Poikile Creations. All rights reserved.

import CryptoKit

extension Insecure.MD5Digest {

    /// Get a base-64 string representation of the digest. (Why doesn't the
    /// framework provide this already?)
    ///
    /// @see: https://stackoverflow.com/a/64607321/665456
    var base64: String {
        return self.map { String(format: "%02hhx", $0) }.joined()
    }

}
