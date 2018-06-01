//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

class BusyViewTests: XCTestCase {

    var busyViewFrame: CGRect {
        return CGRect(x: 0.0, y: 0.0, width: 400.0, height: 700.0)
    }

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

    // MARK: Test Fixtures

    func assertPointsEqual(_ p1: CGPoint, _ p2: CGPoint, accuracy: CGFloat, message: String = "") {
        XCTAssertEqual(p1.x, p2.x, accuracy: 0.3, "points \(p1) and \(p2)'s x values")
        XCTAssertEqual(p1.y, p2.y, accuracy: 0.3, "points \(p1) and \(p2)'s y values")
    }

    func assertSpinnerStarted(spinner: UIActivityIndicatorView) {
        XCTAssertTrue(spinner.isAnimating)
        XCTAssertFalse(spinner.isHidden)
    }

    func assertSpinnerStopped(spinner: UIActivityIndicatorView) {
        XCTAssertFalse(spinner.isAnimating)
        XCTAssertTrue(spinner.isHidden)
    }

    // MARK: Dummy Implementations

    class DefaultSpinnerBusyView: UIView, SpinnerBusyView {

        var spinner: UIActivityIndicatorView?

    }

    class UnaddedCustomSpinnerBusyView: UIView, SpinnerBusyView {

        var spinner: UIActivityIndicatorView? = UIActivityIndicatorView(activityIndicatorStyle: .white)

    }

    class AddedCustomSpinnerBusyView: UIView, SpinnerBusyView {

        var spinner: UIActivityIndicatorView?

        override init(frame: CGRect) {
            super.init(frame: frame)
            spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            addSubview(spinner!)
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    }

}
