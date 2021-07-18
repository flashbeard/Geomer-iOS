import XCTest
@testable import Math

final class MathTests_Fraction: XCTestCase {

	var testCase: Int = 0

	override func setUp() {
		super.setUp()
		testCase = 0
	}

	override func tearDown() {
		super.tearDown()
	}

	func testInit() {
		var testFraction: Fraction

		testCase += 1
		testFraction = try! Fraction(numerator: 5, denumerator: 10)

		XCTAssertEqual(0, testFraction.integer, "[case \(testCase)] - Incorrect integer")
		XCTAssertEqual(5, testFraction.numerator, "[case \(testCase)] - Incorrect numerator")
		XCTAssertEqual(10, testFraction.denumerator, "[case \(testCase)] - Incorrect denumerator")

		testCase += 1
		testFraction = try! Fraction(integer: 1, numerator: 2, denumerator: 3)

		XCTAssertEqual(testFraction.integer, 1, "[case \(testCase)] - Incorrect integer")
		XCTAssertEqual(testFraction.numerator, 2, "[case \(testCase)] - Incorrect numerator")
		XCTAssertEqual(testFraction.denumerator, 3, "[case \(testCase)] - Incorrect denumerator")

		testCase += 1
		testFraction = try! Fraction(integer: 1, numerator: 2, denumerator: 3)

		XCTAssertEqual(testFraction.integer, 1, "[case \(testCase)] - Incorrect integer")
		XCTAssertEqual(testFraction.numerator, 2, "[case \(testCase)] - Incorrect numerator")
		XCTAssertEqual(testFraction.denumerator, 3, "[case \(testCase)] - Incorrect denumerator")

		testCase += 1
		do {
			_ = try Fraction(numerator: 1, denumerator: 0)
		} catch {
			XCTAssertEqual(FractionError.ambiguous, error as! FractionError, "[case \(testCase)]")
		}
	}

	func testName() {
		var testFraction: Fraction

		testCase += 1
		testFraction = try! Fraction(numerator: 0, denumerator: 1)
		XCTAssertEqual("0", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(integer: -1, numerator: 0, denumerator: 1)
		XCTAssertEqual("-1", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: 5, denumerator: 10)
		XCTAssertEqual("5/10", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: -10, denumerator: 10)
		XCTAssertEqual("-10/10", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(integer: -1, numerator: -2, denumerator: 3)
		XCTAssertEqual("-1(-2/3)", testFraction.name, "[case \(testCase)]")
	}

	func testNormalize() {
		var testFraction: Fraction

		testCase += 1
		testFraction = try! Fraction(numerator: 5, denumerator: 5)
		testFraction.normalize()
		XCTAssertEqual("1", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: 5, denumerator: 10)
		testFraction.normalize()
		XCTAssertEqual("1/2", testFraction.name, "[case \(testCase)]")

		testCase += 2
		testFraction = try! Fraction(integer: 2, numerator: 9, denumerator: 4)
		testFraction.normalize()
		XCTAssertEqual("4(1/4)", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: -8, denumerator: 7)
		testFraction.normalize()
		XCTAssertEqual("-1(-1/7)", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(integer: -1, numerator: -8, denumerator: 7)
		testFraction.normalize()
		XCTAssertEqual("-2(-1/7)", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(integer: -1, numerator: 8, denumerator: 7)
		testFraction.normalize()
		XCTAssertEqual("1/7", testFraction.name, "[case \(testCase)]")
	}

	func testImproper() {
		var testFraction: Fraction

		testCase += 1
		testFraction = try! Fraction(numerator: 5, denumerator: 10)
		testFraction.improper()
		XCTAssertEqual("1/2", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: 10, denumerator: 10)
		testFraction.improper()
		XCTAssertEqual("1/1", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: -8, denumerator: 7)
		testFraction.improper()
		XCTAssertEqual("-8/7", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(integer: -1, numerator: -8, denumerator: 7)
		testFraction.improper()
		XCTAssertEqual("-15/7", testFraction.name, "[case \(testCase)]")
	}

	func testMultiply() {
		var testFraction: Fraction

		testCase += 1
		testFraction = try! Fraction(numerator: 1, denumerator: 1)
		testFraction.multiply(by: 0)
		XCTAssertEqual("0", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: 1, denumerator: 1)
		testFraction.multiply(by: 1)
		XCTAssertEqual("1", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: 1, denumerator: 1)
		testFraction.multiply(by: 2)
		XCTAssertEqual("2", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: 1, denumerator: 2)
		testFraction.multiply(by: 5)
		XCTAssertEqual("2(1/2)", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: 1, denumerator: 2)
		testFraction.multiply(by: -5)
		XCTAssertEqual("-2(-1/2)", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(integer: 1, numerator: 1, denumerator: 2)
		testFraction.multiply(by: -4)
		XCTAssertEqual("-6", testFraction.name, "[case \(testCase)]")
	}

	func testDivide() {
		var testFraction: Fraction

		testCase += 1
		testFraction = try! Fraction(numerator: 1,	 denumerator: 1)
		do {
			try testFraction.divide(by: 0)
		} catch {
			XCTAssertEqual(MathOperationError.divisionByZero, error as! MathOperationError, "[case \(testCase)]")
		}

		testCase += 1
		testFraction = try! Fraction(numerator: 1, denumerator: 1)
		try! testFraction.divide(by: 1)
		XCTAssertEqual("1", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: 0, denumerator: 1)
		try! testFraction.divide(by: 10)
		XCTAssertEqual("0", testFraction.name, "[case \(testCase)]")

		testCase += 1
		testFraction = try! Fraction(numerator: 5, denumerator: 2)
		try! testFraction.divide(by: -5)
		XCTAssertEqual("-1/2", testFraction.name, "[case \(testCase)]")
	}
}
