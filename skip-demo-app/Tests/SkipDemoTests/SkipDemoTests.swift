import XCTest
import OSLog
import Foundation
@testable import SkipDemo

let logger: Logger = Logger(subsystem: "SkipDemo", category: "Tests")

@available(macOS 13, *)
final class SkipDemoTests: XCTestCase {

    func testSkipDemo() throws {
        logger.log("running testSkipDemo")
        XCTAssertEqual(1 + 2, 3, "basic test")
    }

    func testDecodeType() throws {
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("SkipDemo", testData.testModuleName)
    }

}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
