//  Copyright © 2018 Poikile Creations. All rights reserved.

@testable import Stylobate
import XCTest

class FormattedLabelTests: XCTestCase {

    func testSetTextWithNilFormatLeavesTextAsIs() {
        let label = FormattedLabel(frame: CGRect())
        label.text = nil
        let superview = UIView(frame: CGRect())
        superview.addSubview(label)

        let newText = "FAGABEFE"
        label.text = newText
        XCTAssertEqual(label.text, newText)
    }

    func testSetTextWithEmptyFormatIgnoresFormat() {
        let label = FormattedLabel(frame: CGRect())
        label.text = ""
        let superview = UIView(frame: CGRect())
        superview.addSubview(label)

        let newText = "FAGABEFE"
        label.text = newText
        XCTAssertEqual(label.text, newText)
    }

    func testSetTextWithFormatContainingNoFormattingCharactersIgnoresFormat() {
        let label = FormattedLabel(frame: CGRect())
        label.text = "This initial text has no formatting characters"
        let superview = UIView(frame: CGRect())
        superview.addSubview(label)

        let newText = "FAGABEFE"
        label.text = newText
        XCTAssertEqual(label.text, newText)
    }

    func testSetTextWithFormatOk() {
        let label = FormattedLabel(frame: CGRect())
        label.text = "'%@' is a nonsense word that's written in hex."
        let superview = UIView(frame: CGRect())
        superview.addSubview(label)

        let newText = "FAGABEFE"
        label.text = newText
        XCTAssertEqual(label.text, "'FAGABEFE' is a nonsense word that's written in hex.")
    }

    func testSetAttributedTextWithFormatLeavesAttributedTextAsIs() {
        let label = FormattedLabel(frame: CGRect())
        label.text = "'%@' is a nonsense word that's written in hex."
        let superview = UIView(frame: CGRect())
        superview.addSubview(label)

        let attributedText = NSAttributedString(string: "Inconsequential", attributes: [.backgroundColor : #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)])
        label.attributedText = attributedText
        XCTAssertEqual(label.attributedText, attributedText)
    }

    func testSetTextWithFormatInStoryboardOk() {
        let storyboard = UIStoryboard(name: "FormattedLabelTests",
                                      bundle: Bundle(for: FormattedLabelTests.self))
        let viewController = storyboard.instantiateInitialViewController()!
        let view = viewController.view as! FormattedLabelTestsView
        let label = view.labelWithFormat!

        let newText = "FAGABEFE"
        label.text = newText
        XCTAssertEqual(label.text, "Formatted as 'FAGABEFE'.")
    }
}

class FormattedLabelTestsView: UIView {

    @IBOutlet weak var labelWithFormat: FormattedLabel!

    @IBOutlet weak var labelWithoutFormat: FormattedLabel!

}
