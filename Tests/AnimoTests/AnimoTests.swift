import XCTest
@testable import Animo

final class AnimoTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Animo().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
