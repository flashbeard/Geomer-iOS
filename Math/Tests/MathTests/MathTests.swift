import XCTest
@testable import Math

final class MathTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Math().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
