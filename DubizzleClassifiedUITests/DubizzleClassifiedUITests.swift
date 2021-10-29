//
//  DubizzleClassifiedUITests.swift
//  DubizzleClassifiedUITests
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import XCTest

class DubizzleClassifiedUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTableView() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
            
        
        
        // Assert that we are displaying the tableview
        let itemListTableView = app.tables["itemTableView"]
        XCTAssertTrue(itemListTableView.exists, "Dubizzle classified product list exists")
        
        // Wait for data to be fetched from server
        sleep(10)
        
        // Get an array of cells
        let tableCells = itemListTableView.cells
        
        if tableCells.count > 0 {
            let count: Int = (tableCells.count - 1)
            
            let promise = expectation(description: "Wait for table cells")
            
            for i in stride(from: 0, to: count , by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let tableCell = tableCells.element(boundBy: i)
                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                tableCell.tap()
                
                // go back to home page
                app.navigationBars["Dubizzle"].buttons["Dubizzle"].tap()

                if i == (count - 1) {
                    promise.fulfill()
                }
                
            }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
            
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
    
}
