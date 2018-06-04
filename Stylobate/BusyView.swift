//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

public protocol BusyView: class {

    typealias ActivityCompletion = () -> Void

    func startActivity(completion: ActivityCompletion?)

    func stopActivity(completion: ActivityCompletion?)

}

public protocol ProgressBusyView: BusyView {
    
    var progressView: UIProgressView? { get set }

}

public protocol SpinnerBusyView: BusyView {

    var spinner: UIActivityIndicatorView? { get set }

}

// MARK: ProgressBusyView Default Implementation
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

// MARK: SpinnerBusyView: BusyView

public extension SpinnerBusyView where Self: UIView {

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
