import UIKit
import XCTest

class FromNibTests: XCTestCase {
    
    var underTestController: ViewController?
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        underTestController = storyboard.instantiateInitialViewController() as? ViewController
        
        UIApplication.shared.keyWindow?.rootViewController = underTestController
        
        XCTAssertNotNil(underTestController?.preloadView())
    }
    
    override func tearDown() {
        underTestController = nil
        super.tearDown()
    }
    
    func testTableViewNibInitialization() {
        XCTAssertNotNil(underTestController?.wrappedTableView)
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
