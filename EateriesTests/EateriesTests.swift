//
//  EateriesTests.swift
//  EateriesTests
//
//  Created by Tyler Harden on 4/5/21.
//

import XCTest
@testable import Eateries

class EateriesTests: XCTestCase {

        override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
        }

        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
            super.tearDown()

        }

//        func testRestaurantName() throws {
//            // This is an example of a functional test case.
//            // Use XCTAssert and related functions to verify your tests produce the correct results.
//            let name = "Cafe Rossa"
//            let resturantTest = restaurantsDefaultData.restaurant[0]
//            XCTAssertEqual(resturantTest.name, "Cafe Rossa")
//
//        }
//        func testResaurantNotes() throws {
//            // This is an example of a functional test case.
//            // Use XCTAssert and related functions to verify your tests produce the correct results.
//            let notes = "Great dining location"
//            let resturantTest = Restaurant(name: "Cafe Rossa", location: "Griffith", notes: notes, image: "burger", reviews: ["Test4","Test5","Test6"])
//            XCTAssertEqual(resturantTest.notes, "Great dining location")
//
//        }
//        func testRestaurantLocation() throws {
//            // This is an example of a functional test case.
//            // Use XCTAssert and related functions to verify your tests produce the correct results.
//            let location = "Griffith"
//            let resturantTest = Restaurant(name: "Cafe Rossa", location: location, notes: "Great dining location", image: "burger", reviews: ["Test4","Test5","Test6"])
//            XCTAssertEqual(resturantTest.location, "Griffith")
//        }
//        

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
