import UIKit
import XCTest
import MTFConverter

class MTFconverterTests : XCTestCase {
    func testConvertJSONToForm() {
        var simpleForm = [String:AnyObject]()
        simpleForm["key1"] = "hello world"
        simpleForm["key2"] = 100.0
        guard let gForm = MTFConverter.convertJSONForm(simpleForm) else {
            XCTFail()
            return
        }
        XCTAssertEqual(gForm.allRows.count, 2)
    }
}
