//  Copyright © 2019 Poikile Creations. All rights reserved.

import AVFoundation
import UIKit

/// A `UIView` whose layer is an `AVCaptureVideoPreviewLayer`.
open class VideoPreview: UIView {

    // MARK: - UIView Properties

    override open class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }

    // MARK: - Other Properties

    /// Pass-through property for the `videoPreviewLayer.session`.
    public var avCaptureSession: AVCaptureSession? {
        get { return videoPreviewLayer.session }

        set { videoPreviewLayer.session = newValue }
    }

    /// The primary layer, force-cast as an `AVCaptureVideoPreviewLayer`.
    final public var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }

    // MARK: - Initializers

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }

    private func setUp() {
        videoPreviewLayer.videoGravity = .resizeAspectFill
    }

}
