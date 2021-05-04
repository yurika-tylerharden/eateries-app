//
//  EateriesUITests.swift
//  EateriesUITests
//
//  Created by Tyler Harden on 4/5/21.
//

import XCTest

class EateriesUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddFoodButton() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        
        //Launches app
        app.launch()
        //Presses plus (add food) button
        app.navigationBars["Favourite Foods"].buttons["plus"].tap()
        //Counts the amount of cells (foods) in the navigation menu
        let cellCount = XCUIApplication().cells.count
        //Prints debugging description
        print(app.debugDescription)
        //Checks if there is an extra cell
        XCTAssertEqual(cellCount, 4)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testNavigation() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        
        //Launches app
        app.launch()
        //Taps on first cell (Lasagna)
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).tap()
        //Checks if one of the ingredients exists
        XCTAssert(app.staticTexts["55g (1/4 cup) tomato paste"].exists)
    }
    func testDeleteFoodButton() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        
        //Launches app
        app.launch()
        //Swipes left on cell and presses delete button
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        //Prints debug description
        print(app.debugDescription)
        //Checks cell count
        let cellCount = XCUIApplication().cells.count
        //Checks if there is one less cell (food)
        XCTAssertEqual(cellCount, 4)
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
