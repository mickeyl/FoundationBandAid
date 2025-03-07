import XCTest
@testable import FoundationBandAid
#if canImport(CoreFoundation)
import CoreFoundation
#endif

final class RunLoopCFTests: XCTestCase {
    func testCFRunLoop() {
        let runLoop = RunLoop.current
        let cfLoop = runLoop.CC_cfRunLoop
        // The cast should yield a valid CFRunLoop instance.
        XCTAssertNotNil(cfLoop)
    }
}

