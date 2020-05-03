//
//  iMovieSlowTests.swift
//  iMovieTests
//
//  Created by SHABEERALI K on 03/05/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import XCTest
@testable import iMovie
class iMovieSlowTests: XCTestCase {
    var sut: URLSession!
    
    override func setUp() {
        super.setUp()
        sut = URLSession(configuration: .default)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToPopularMoviesAPIGetsHTTPStatusCode200() {
       // given
       let request = URLRequest(url: ServiceType.popular.url)
       // 1
       let promise = expectation(description: "Status code: 200")
       
       // when
       let dataTask = sut.dataTask(with: request) { data, response, error in
         // then
         if let error = error {
           XCTFail("Error: \(error.localizedDescription)")
           return
         } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
           if statusCode == 200 {
             // 2
             promise.fulfill()
           } else {
             XCTFail("Status code: \(statusCode)")
           }
         }
       }
       dataTask.resume()
       // 3
       wait(for: [promise], timeout: 1)
    }
     
    // Asynchronous test: faster fail
    func testCallToiPopularMovieAPICompletes() {
        // given
        let request = URLRequest(url: ServiceType.popular.url)
        // 1
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
       
        // when
        let dataTask = sut.dataTask(with: request) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            // 2
            promise.fulfill()
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 5)
       
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToTopRatedMoviesAPIGetsHTTPStatusCode200() {
        // given
        let request = URLRequest(url: ServiceType.topRated.url)
        // 1
        let promise = expectation(description: "Status code: 200")
      
        // when
        let dataTask = sut.dataTask(with: request) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 1)
    }
    
    // Asynchronous test: faster fail
    func testCallToiTopRatedMovieAPICompletes() {
        // given
        let request = URLRequest(url: ServiceType.topRated.url)
        // 1
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
      
        // when
        let dataTask = sut.dataTask(with: request) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            // 2
            promise.fulfill()
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 5)
      
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToUpcomingMoviesAPIGetsHTTPStatusCode200() {
        // given
        let request = URLRequest(url: ServiceType.upcoming.url)
        // 1
        let promise = expectation(description: "Status code: 200")
      
        // when
        let dataTask = sut.dataTask(with: request) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 1)
    }
    
    // Asynchronous test: faster fail
    func testCallToiTopRatedUpcomingAPICompletes() {
        // given
        let request = URLRequest(url: ServiceType.upcoming.url)
        // 1
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
      
        // when
        let dataTask = sut.dataTask(with: request) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            // 2
            promise.fulfill()
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 5)
      
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
}
