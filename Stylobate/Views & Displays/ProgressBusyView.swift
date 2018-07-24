//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

/// Implemented by views that show a progress bar when an activity is executing.
/// The default implementation will add a `UIProgressView` if your
/// implementation doesn't set one.
public protocol ProgressBusyView: BusyView {

    /// The progress view to display. Your implementation must create a property
    /// or outlet for it, but doesn't have to initialize it or connect it in a
    /// storyboard or nib, because the default implementation can create one.
    var progressView: UIProgressView? { get set }

}

// MARK: - ProgressBusyView Default Implementation

public extension ProgressBusyView where Self: UIView {

    public func startActivity(completion: BusyView.ActivityCompletion? = nil) {
        if progressView == nil {
            progressView = UIProgressView(progressViewStyle: .default)
        }

        if progressView?.superview == nil {
            addSubview(progressView!)
            progressView?.centerInSuperview()
            setNeedsUpdateConstraints()
            layoutIfNeeded()
        }

        progressView?.isHidden = false
        completion?()
    }

    public func stopActivity(completion: BusyView.ActivityCompletion?) {
        progressView?.isHidden = true
        completion?()
    }

}
