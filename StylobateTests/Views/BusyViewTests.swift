//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

class BusyViewTests: XCTestCase {

    var busyViewFrame: CGRect {
        return CGRect(x: 0.0, y: 0.0, width: 400.0, height: 700.0)
    }

    // MARK: SpinnerBusyView Tests

    func testDefaultSpinnerBusyViewAddsLargeWhiteStyleSpinner() {
        let view = DefaultSpinnerBusyView(frame: busyViewFrame)
        XCTAssertNil(view.spinner)

        let startExpectation = expectation(description: "SpinnerBusyView start")

        view.startActivity {
            XCTAssertNotNil(view.spinner)
            XCTAssertEqual(view.spinner!.superview, view)
            XCTAssertEqual(view.spinner!.activityIndicatorViewStyle, UIActivityIndicatorViewStyle.whiteLarge)
            self.assertPointsEqual(view.spinner!.center, view.center, accuracy: 0.3)

            self.assertSpinnerStarted(spinner: view.spinner!)
            startExpectation.fulfill()
        }

        wait(for: [startExpectation], timeout: 2.0)

        let stopExpectation = expectation(description: "SpinnerBusyView stop")

        view.stopActivity() {
            self.assertSpinnerStopped(spinner: view.spinner!)
            stopExpectation.fulfill()
        }

        wait(for: [stopExpectation], timeout: 2.0)
    }

    func testSpinnerBusyViewWithUnaddedSpinnerAddsSpinner() {
        let view = UnaddedCustomSpinnerBusyView(frame: busyViewFrame)
        XCTAssertNotNil(view.spinner)
        XCTAssertNil(view.spinner?.superview)

        let startExpectation = expectation(description: "SpinnerBusyView start")

        view.startActivity() {
            XCTAssertEqual(view.spinner!.superview, view)
            self.assertPointsEqual(view.spinner!.center, view.center, accuracy: 0.3)
            self.assertSpinnerStarted(spinner: view.spinner!)
            startExpectation.fulfill()
        }

        wait(for: [startExpectation], timeout: 2.0)

        let stopExpectation = expectation(description: "SpinnerBusyView stop")

        view.stopActivity() {
            self.assertSpinnerStopped(spinner: view.spinner!)
            stopExpectation.fulfill()
        }

        wait(for: [stopExpectation], timeout: 2.0)
    }

    func testSpinnerBusyViewWithSpinnerAlreadyAddedOk() {
        let view = AddedCustomSpinnerBusyView(frame: busyViewFrame)
        XCTAssertNotNil(view.spinner)
        XCTAssertEqual(view.spinner!.superview, view)

        let startExpectation = expectation(description: "SpinnerBusyView start")

        view.startActivity() {
            self.assertSpinnerStarted(spinner: view.spinner!)
            startExpectation.fulfill()
        }

        wait(for: [startExpectation], timeout: 2.0)

        let stopExpectation = expectation(description: "SpinnerBusyView stop")

        view.stopActivity() {
            self.assertSpinnerStopped(spinner: view.spinner!)
            stopExpectation.fulfill()
        }

        wait(for: [stopExpectation], timeout: 2.0)
    }

    // MARK: ProgressBusyView Tests

    func testDefaultProgressBusyViewAddsLargeWhiteStyleSpinner() {
        let view = DefaultProgressBusyView(frame: busyViewFrame)
        XCTAssertNil(view.progressView)

        let startExpectation = expectation(description: "ProgressBusyView start")

        view.startActivity {
            XCTAssertNotNil(view.progressView)
            XCTAssertEqual(view.progressView!.superview, view)
            XCTAssertEqual(view.progressView!.progressViewStyle, UIProgressViewStyle.default)
            self.assertPointsEqual(view.progressView!.center, view.center, accuracy: 0.3)

            self.assertProgressViewStarted(view.progressView!)
            startExpectation.fulfill()
        }

        wait(for: [startExpectation], timeout: 2.0)

        let stopExpectation = expectation(description: "ProgressBusyView stop")

        view.stopActivity() {
            self.assertProgressViewStopped(view.progressView!)
            stopExpectation.fulfill()
        }

        wait(for: [stopExpectation], timeout: 2.0)
    }

    func testProgressBusyViewWithUnaddedSpinnerAddsSpinner() {
        let view = UnaddedCustomProgressBusyView(frame: busyViewFrame)
        XCTAssertNotNil(view.progressView)
        XCTAssertNil(view.progressView?.superview)

        let startExpectation = expectation(description: "ProgressBusyView start")

        view.startActivity() {
            XCTAssertEqual(view.progressView!.superview, view)
            self.assertPointsEqual(view.progressView!.center, view.center, accuracy: 0.3)
            self.assertProgressViewStarted(view.progressView!)
            startExpectation.fulfill()
        }

        wait(for: [startExpectation], timeout: 2.0)

        let stopExpectation = expectation(description: "ProgressBusyView stop")

        view.stopActivity() {
            self.assertProgressViewStopped(view.progressView!)
            stopExpectation.fulfill()
        }

        wait(for: [stopExpectation], timeout: 2.0)
    }

    func testProgressBusyViewWithSpinnerAlreadyAddedOk() {
        let view = AddedCustomProgressBusyView(frame: busyViewFrame)
        XCTAssertNotNil(view.progressView)
        XCTAssertEqual(view.progressView!.superview, view)

        let startExpectation = expectation(description: "ProgressBusyView start")

        view.startActivity() {
            self.assertProgressViewStarted(view.progressView!)
            startExpectation.fulfill()
        }

        wait(for: [startExpectation], timeout: 2.0)

        let stopExpectation = expectation(description: "ProgressBusyView stop")

        view.stopActivity() {
            self.assertProgressViewStopped(view.progressView!)
            stopExpectation.fulfill()
        }

        wait(for: [stopExpectation], timeout: 2.0)
    }

    // MARK: Test Fixtures

    func assertPointsEqual(_ p1: CGPoint, _ p2: CGPoint, accuracy: CGFloat, message: String = "") {
        XCTAssertEqual(p1.x, p2.x, accuracy: 1.0, "points \(p1) and \(p2)'s x values")
        XCTAssertEqual(p1.y, p2.y, accuracy: 1.0, "points \(p1) and \(p2)'s y values")
    }

    func assertSpinnerStarted(spinner: UIActivityIndicatorView) {
        XCTAssertTrue(spinner.isAnimating)
        XCTAssertFalse(spinner.isHidden)
    }

    func assertSpinnerStopped(spinner: UIActivityIndicatorView) {
        XCTAssertFalse(spinner.isAnimating)
        XCTAssertTrue(spinner.isHidden)
    }

    func assertProgressViewStarted(_ progressView: UIProgressView) {
        XCTAssertFalse(progressView.isHidden)
    }

    func assertProgressViewStopped(_ progressView: UIProgressView) {
        XCTAssertTrue(progressView.isHidden)
    }

    // MARK: Dummy Implementations

    class DefaultSpinnerBusyView: UIView, SpinnerBusyView {

        var spinner: UIActivityIndicatorView?

    }

    class UnaddedCustomSpinnerBusyView: UIView, SpinnerBusyView {

        var spinner: UIActivityIndicatorView? = UIActivityIndicatorView(activityIndicatorStyle: .white)

    }

    class AddedCustomSpinnerBusyView: UIView, SpinnerBusyView {

        lazy var spinner: UIActivityIndicatorView? = {
            let spinnerView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            addSubview(spinnerView)

            return spinnerView
        }()

    }

    class DefaultProgressBusyView: UIView, ProgressBusyView {

        var progressView: UIProgressView?

    }

    class UnaddedCustomProgressBusyView: UIView, ProgressBusyView {

        var progressView: UIProgressView? = UIProgressView(progressViewStyle: .bar)

    }

    class AddedCustomProgressBusyView: UIView, ProgressBusyView {

        lazy var progressView: UIProgressView? = {
            let progress = UIProgressView(progressViewStyle: .bar)
            addSubview(progress)

            return progress
        }()

    }

}