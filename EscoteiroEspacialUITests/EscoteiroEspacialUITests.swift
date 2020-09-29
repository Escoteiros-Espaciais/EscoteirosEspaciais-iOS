//
//  EscoteiroEspacialUITests.swift
//  EscoteiroEspacialUITests
//
//  Created by Mateus Nobre on 03/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import XCTest

class EscoteiroEspacialUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCUIDevice.shared.orientation = .landscapeRight
        
        _ = XCUIApplication()
        app.buttons["Skip"].tap()
        sleep(1)
        app.buttons["Sol"].tap()
        app.buttons["teste button"].tap()
        app.buttons["back button2"].tap()
        
        let backButtonButton = app.buttons["back button"]
        backButtonButton.tap()
        app.buttons["Mercurio"].tap()
        backButtonButton.tap()
        app.buttons["Venus"].tap()
        backButtonButton.tap()
        app.buttons["Lua"].tap()
        backButtonButton.tap()
        app.buttons["Terra"].tap()
        backButtonButton.tap()
        app.buttons["Marte"].tap()
        backButtonButton.tap()
        app.buttons["Jupiter"].tap()
        backButtonButton.tap()
        app.buttons["Saturno"].tap()
        backButtonButton.tap()
        app.buttons["Urano"].tap()
        backButtonButton.tap()
        app.buttons["Netuno"].tap()
        backButtonButton.tap()
        
        
        
      
              

   
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
