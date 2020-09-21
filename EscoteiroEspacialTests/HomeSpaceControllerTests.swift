//
//  HomeSpaceControllerTests.swift
//  EscoteiroEspacialTests
//
//  Created by Mateus Nobre on 21/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import XCTest
@testable import EscoteiroEspacial

class HomeSpaceControllerTests: XCTestCase {

    let homeSpaceController = HomeSpaceController()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_segue_string_to_astro() {
        
        var astro: Astro = homeSpaceController.segueStringToAstro(with: "PassSunInfo")
        XCTAssertEqual(astro, .sunn)
        
        astro = homeSpaceController.segueStringToAstro(with: "PassMercuryInfo")
        XCTAssertEqual(astro, .mercury)
        
        astro = homeSpaceController.segueStringToAstro(with: "PassVenusInfo")
        XCTAssertEqual(astro, .venus)
        
        astro = homeSpaceController.segueStringToAstro(with: "PassMoonInfo")
        XCTAssertEqual(astro, .moon)
        
        astro = homeSpaceController.segueStringToAstro(with: "PassEarthInfo")
        XCTAssertEqual(astro, .earth)
        
        astro = homeSpaceController.segueStringToAstro(with: "PassMarsInfo")
        XCTAssertEqual(astro, .mars)
        
        astro = homeSpaceController.segueStringToAstro(with: "PassJupiterInfo")
        XCTAssertEqual(astro, .jupiter)
        
        astro = homeSpaceController.segueStringToAstro(with: "PassSaturnInfo")
        XCTAssertEqual(astro, .saturn)
        
        astro = homeSpaceController.segueStringToAstro(with: "PassUranInfo")
        XCTAssertEqual(astro, .uran)
        
        astro = homeSpaceController.segueStringToAstro(with: "PassNeptunInfo")
        XCTAssertEqual(astro, .neptun)
        
        astro = homeSpaceController.segueStringToAstro(with: "NomeErrado")
        XCTAssertEqual(astro, .unknown)
        
    }
    

}
