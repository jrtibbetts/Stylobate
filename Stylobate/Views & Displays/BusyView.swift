//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

/// Implemented by views that can indicate when an operation is in progress,
/// such as with a spinner or progress bar. However, this protocol doesn't
/// force the implementation to indicate this with a *view*; the implementation
/// could just as well play a sound, dim or disable itself, or something else.
public protocol BusyView: class {

    /// Signature of a block to execute when an activity is stopped or
    /// started.
    typealias ActivityCompletion = () -> Void

    /// Start the activity, and execute the optional completion when it's
    /// finished.
    ///
    /// - parameter completion: The block to execute when the activity has
    ///             finished starting. (Yes, really.)
    func startActivity(completion: ActivityCompletion?)

    /// Stop the activity, and execute the optional completion when it's
    /// finished.
    ///
    /// - parameter completion: The block to execute when the activity has
    ///             finished stopping. (Yes, really.)
    func stopActivity(completion: ActivityCompletion?)

}

/// Implemented by views that show a progress bar when an activity is executing.
/// The default implementation will add a `UIProgressView` if your
/// implementation doesn't set one.
public protocol ProgressBusyView: BusyView {

    /// The progress view to display. Your implementation must create a property
    /// or outlet for it, but doesn't have to initialize it or connect it in a
    /// storyboard or nib, because the default implementation can create one.
    var progressView: UIProgressView? { get set }

}

/// Implemented by views that show a spinner when an activity is in progress.
/// The default implementation will add a `UIActivityIndicatorView` if your
/// implementation doesn't set one.
public protocol SpinnerBusyView: BusyView {

    /// The spinner to display. Your implementation must create a property or
    /// outlet for it, but doesn't have to initialize it or connect it in a
    /// storyboard or nib, because the default implementation can create one.
    var spinner: UIActivityIndicatorView? { get set }

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

// MARK: - SpinnerBusyView Default Implementation

public extension SpinnerBusyView where Self: UIView {

    /// Start the activity by showing and starting a spinner. If the spinner
    /// is `nil`, one will be added automatically.
    ///
    /// - parameter completion: The block to execute when the activity has
    ///             finished starting. (Yes, really.)
    public func startActivity(completion: BusyView.ActivityCompletion? = nil) {
        if spinner == nil {
            spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        }

        if let spinner = spinner {
            if spinner.superview == nil {
                addSubview(spinner)
                spinner.centerInSuperview()
                setNeedsUpdateConstraints()
                layoutIfNeeded()
            }

            spinner.hidesWhenStopped = true
            spinner.startAnimating()
            completion?()
        }
    }

    public func stopActivity(completion: BusyView.ActivityCompletion? = nil) {
        spinner?.stopAnimating()
        completion?()
    }

}
