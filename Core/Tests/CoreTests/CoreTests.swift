import XCTest
@testable import Core

final class CoreDataTests: XCTestCase {

	func tInit() {
		let data = Core.Data(name: "", isInput: true)
		XCTAssertTrue(data.isInput, "Core.Data.init(): incorrect isInput [1]")
		XCTAssertEqual(data.name, "", "Core.Data.init(): incorrect name [1]")

		let data1 = Core.Data(name: "somename")
		XCTAssertFalse(data1.isInput, "Core.Data.init(): incorrect isInput [2]")
		XCTAssertEqual(data1.name, "somename", "Core.Data.init(): incorrect name [2]")
	}

	static var allTests = [
		("Test: Core.Data.init", tInit)
	]

}
