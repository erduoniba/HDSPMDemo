import XCTest
@testable import HDSwiftLibrary

import HDOCLibrary

final class HDLibraryTests: XCTestCase {
    let lib = HDLibrary()
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(HDLibrary().text, "Hello, World!")
        lib.printAFInfo()
        
        HDLibrary2.printInfo()
        
        HDOCLibrary.ocPrint()
    }
}
