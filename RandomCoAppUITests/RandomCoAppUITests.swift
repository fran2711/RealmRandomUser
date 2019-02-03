//
//  RandomCoAppUITests.swift
//  RandomCoAppUITests
//
//  Created by Francisco Lucena de Juan on 03/02/2019.
//  Copyright © 2019 Francisco Lucena de Juan. All rights reserved.
//

import XCTest

class RandomCoAppUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testExample() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["elias christensen"].tap()
        let usersButton = app.navigationBars["RandomCoApp.UserDetailView"].buttons["Users"]
        usersButton.tap()
        app.navigationBars["Users"].buttons["Add"].tap()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"nathanaël muller")/*[[".cells.containing(.staticText, identifier:\"06-52-91-51-73\")",".cells.containing(.staticText, identifier:\"nathanaël.muller@example.com\")",".cells.containing(.staticText, identifier:\"nathanaël muller\")"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["like"].tap()
    }

}
