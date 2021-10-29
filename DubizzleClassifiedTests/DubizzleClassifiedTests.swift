//
//  DubizzleClassifiedTests.swift
//  DubizzleClassifiedTests
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import XCTest
@testable import DubizzleClassified

class DubizzleClassifiedTests: XCTestCase {

    var sut: URLSession!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()

        sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
        
    }
    
    func testSuccessFetchData() throws {
        // given
        let urlString = Constants.APIURL
        let url = URL(string: urlString)!

        // 1
        let promise = expectation(description: "Fetch Success")
        
        // when
        let dataTask = sut.dataTask(with: url) { data, response, error in
            // then
            if let error = error {
              XCTFail("Error: \(error.localizedDescription)")
              return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Fetch Failed with Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()

        // 3
        wait(for: [promise], timeout: 15)
    }
    
    func testFetchDataComplete() throws {
        // given
        let urlString = Constants.APIURL
        let url = URL(string: urlString)!
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?

        // when
        let dataTask = sut.dataTask(with: url) { data, response, error in
          statusCode = (response as? HTTPURLResponse)?.statusCode
          responseError = error
          promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 15)

        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }

   
}
