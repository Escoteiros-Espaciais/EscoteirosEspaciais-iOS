//
//  EscoteiroEspacialTests.swift
//  EscoteiroEspacialTests
//
//  Created by Mateus Nobre on 03/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import XCTest
@testable import EscoteiroEspacial

class EscoteiroEspacialTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_comet_have_particle_system() {
        let cometNode = CometNode()
        
        cometNode.getComet()
        
        XCTAssertEqual(cometNode.particleSystems?.count, 1)
    }

}
