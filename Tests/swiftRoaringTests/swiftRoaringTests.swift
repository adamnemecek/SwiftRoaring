import XCTest
@testable import SwiftRoaring


extension swiftRoaringTests {
    static var allTests : [(String, (swiftRoaringTests) -> () throws -> Void)] {
        return [
            ("testAdd", testAdd),
            ("testRemove", testRemove),
            ("testClear", testClear)
        ]
    }
}

class swiftRoaringTests: XCTestCase {
    var rbm: RoaringBitmap!

    override func setUp() {
        super.setUp()
        rbm = RoaringBitmap()
    }

    func testAdd() {
        rbm.add(x: 35)
        XCTAssertEqual(rbm.contains(x: 35), true)
    }

    func testRemove() {
        rbm.add(x: 35)
        rbm.remove(x: 35)
        XCTAssertEqual(rbm.contains(x: 35), false)
    }

    func testClear() {
        for k in stride(from: 0, to: 100000000, by: 100 ) {
            rbm.add(x: UInt32(k))
        }
        XCTAssertEqual(rbm.isEmpty(), false)
        rbm.clear()
        XCTAssertEqual(rbm.isEmpty(), true)
    }

}