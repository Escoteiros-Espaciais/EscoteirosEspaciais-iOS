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
        
        
        let app2 = app
        _ = app2
        app.buttons["Skip"].tap()
        sleep(1)
        app.buttons["Sol"].tap()
        
        let testeButtonButton = app.buttons["teste button"]
        testeButtonButton.tap()
        
        let solStaticText = app2/*@START_MENU_TOKEN@*/.buttons["Sol"].staticTexts["Sol"]/*[[".buttons[\"Sol\"].staticTexts[\"Sol\"]",".staticTexts[\"Sol\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        solStaticText.tap()
        solStaticText.tap()
        solStaticText.tap()
        
        let nOStaticText = app2/*@START_MENU_TOKEN@*/.buttons["Não"].staticTexts["Não"]/*[[".buttons[\"Não\"].staticTexts[\"Não\"]",".staticTexts[\"Não\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
//        nOStaticText.tap()
        
        let backButton2Button = app.buttons["back button2"]
        backButton2Button.tap()
        
        let backButtonButton = app.buttons["back button"]
        backButtonButton.tap()
        app.buttons["Mercurio"].tap()
        testeButtonButton.tap()
        
        let mercRioStaticText = app2/*@START_MENU_TOKEN@*/.buttons["Mercúrio"].staticTexts["Mercúrio"]/*[[".buttons[\"Mercúrio\"].staticTexts[\"Mercúrio\"]",".staticTexts[\"Mercúrio\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        mercRioStaticText.tap()
        
        let luaStaticText = app2/*@START_MENU_TOKEN@*/.buttons["Lua"].staticTexts["Lua"]/*[[".buttons[\"Lua\"].staticTexts[\"Lua\"]",".staticTexts[\"Lua\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        luaStaticText.tap()
        mercRioStaticText.tap()
//        app2/*@START_MENU_TOKEN@*/.staticTexts["Nenhuma"]/*[[".buttons[\"Nenhuma\"].staticTexts[\"Nenhuma\"]",".staticTexts[\"Nenhuma\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        backButton2Button.tap()
        backButtonButton.tap()
        app.buttons["Venus"].tap()
        testeButtonButton.tap()
        
        let vNusStaticText = app2/*@START_MENU_TOKEN@*/.buttons["Vênus"].staticTexts["Vênus"]/*[[".buttons[\"Vênus\"].staticTexts[\"Vênus\"]",".staticTexts[\"Vênus\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        vNusStaticText.tap()
        solStaticText.tap()
        vNusStaticText.tap()
//        vNusStaticText.tap()
        backButton2Button.tap()
        backButtonButton.tap()
        app.buttons["Terra"].tap()
        testeButtonButton.tap()
        luaStaticText.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Uma"].staticTexts["Uma"]/*[[".buttons[\"Uma\"].staticTexts[\"Uma\"]",".staticTexts[\"Uma\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        let simStaticText = app2/*@START_MENU_TOKEN@*/.buttons["Sim"].staticTexts["Sim"]/*[[".buttons[\"Sim\"].staticTexts[\"Sim\"]",".staticTexts[\"Sim\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        simStaticText.tap()
        
        let marteStaticText = app2/*@START_MENU_TOKEN@*/.buttons["Marte"].staticTexts["Marte"]/*[[".buttons[\"Marte\"].staticTexts[\"Marte\"]",".staticTexts[\"Marte\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
//        marteStaticText.tap()
        backButton2Button.tap()
        backButtonButton.tap()
        
        app.buttons["Lua"].tap()
        testeButtonButton.tap()
        marteStaticText.tap()
        nOStaticText.tap()
        simStaticText.tap()
//        app2/*@START_MENU_TOKEN@*/.buttons["Errado"].staticTexts["Errado"]/*[[".buttons[\"Errado\"].staticTexts[\"Errado\"]",".staticTexts[\"Errado\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        backButton2Button.tap()
        backButtonButton.tap()
        
        app.buttons["Marte"].tap()
        testeButtonButton.tap()
        simStaticText.tap()
        nOStaticText.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Netuno"].staticTexts["Netuno"]/*[[".buttons[\"Netuno\"].staticTexts[\"Netuno\"]",".staticTexts[\"Netuno\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
//        app2/*@START_MENU_TOKEN@*/.buttons["Duas"].staticTexts["Duas"]/*[[".buttons[\"Duas\"].staticTexts[\"Duas\"]",".staticTexts[\"Duas\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        backButton2Button.tap()
        backButtonButton.tap()
        
        app.buttons["Jupiter"].tap()
        testeButtonButton.tap()
        mercRioStaticText.tap()
        nOStaticText.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Ganimedes"].staticTexts["Ganimedes"]/*[[".buttons[\"Ganimedes\"].staticTexts[\"Ganimedes\"]",".staticTexts[\"Ganimedes\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
//        mercRioStaticText.tap()
        backButton2Button.tap()
        backButtonButton.tap()
        
        app.buttons["Saturno"].tap()
        testeButtonButton.tap()
        
        let terraStaticText = app2/*@START_MENU_TOKEN@*/.buttons["Terra"].staticTexts["Terra"]/*[[".buttons[\"Terra\"].staticTexts[\"Terra\"]",".staticTexts[\"Terra\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        terraStaticText.tap()
        solStaticText.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Amarelo"].staticTexts["Amarelo"]/*[[".buttons[\"Amarelo\"].staticTexts[\"Amarelo\"]",".staticTexts[\"Amarelo\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        let umPlanetaGasosoStaticText = app2/*@START_MENU_TOKEN@*/.buttons["um planeta gasoso."].staticTexts["um planeta gasoso."]/*[[".buttons[\"um planeta gasoso.\"].staticTexts[\"um planeta gasoso.\"]",".staticTexts[\"um planeta gasoso.\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
//        umPlanetaGasosoStaticText.tap()
        backButton2Button.tap()
        backButtonButton.tap()
        
        app.buttons["Urano"].tap()
        testeButtonButton.tap()
        simStaticText.tap()
        umPlanetaGasosoStaticText.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Urano"].staticTexts["Urano"]/*[[".buttons[\"Urano\"].staticTexts[\"Urano\"]",".staticTexts[\"Urano\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
//        nOStaticText.tap()
        backButton2Button.tap()
        backButtonButton.tap()
        
        app.buttons["Netuno"].tap()
        testeButtonButton.tap()
        luaStaticText.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Júpiter"].staticTexts["Júpiter"]/*[[".buttons[\"Júpiter\"].staticTexts[\"Júpiter\"]",".staticTexts[\"Júpiter\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Cometa"].staticTexts["Cometa"]/*[[".buttons[\"Cometa\"].staticTexts[\"Cometa\"]",".staticTexts[\"Cometa\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
//        terraStaticText.tap()
        backButton2Button.tap()
        backButtonButton.tap()
        
        
//        _ = XCUIApplication()
//        app.buttons["Skip"].tap()
//        sleep(1)
//        app.buttons["Sol"].tap()
//        app.buttons["teste button"].tap()
//        app.buttons["back button2"].tap()
//
//        let backButtonButton = app.buttons["back button"]
//        backButtonButton.tap()
//        app.buttons["Mercurio"].tap()
//        backButtonButton.tap()
//        app.buttons["Venus"].tap()
//        backButtonButton.tap()
//        app.buttons["Lua"].tap()
//        backButtonButton.tap()
//        app.buttons["Terra"].tap()
//        backButtonButton.tap()
//        app.buttons["Marte"].tap()
//        backButtonButton.tap()
//        app.buttons["Jupiter"].tap()
//        backButtonButton.tap()
//        app.buttons["Saturno"].tap()
//        backButtonButton.tap()
//        app.buttons["Urano"].tap()
//        backButtonButton.tap()
//        app.buttons["Netuno"].tap()
//        app.buttons["teste button"].tap()
//        app.buttons["Lua"].staticTexts["Lua"].tap()
//        app.buttons["Netuno"].staticTexts["Netuno"].tap()
//        app.buttons["Tritão"].staticTexts["Tritão"].tap()
//        app.buttons["Sol"].staticTexts["Sol"].tap()
//        app.buttons["back button2"].tap()
//        app.buttons["back button"].tap()
       
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
