import XCTest
import OSLog
import Foundation
@testable import SkipDiaryDemo

let logger: Logger = Logger(subsystem: "SkipDiaryDemo", category: "Tests")

@available(macOS 13, *)
final class SkipDiaryDemoTests: XCTestCase {

    func testSkipDiaryDemo() throws {
        logger.log("running testSkipDiaryDemo")
        XCTAssertEqual(1 + 2, 3, "basic test")
    }

    func testDecodeType() throws {
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("SkipDiaryDemo", testData.testModuleName)
    }

}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
