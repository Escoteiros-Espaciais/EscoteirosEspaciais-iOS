//
//  InfoControllerTests.swift
//  EscoteiroEspacialTests
//
//  Created by Mateus Nobre on 25/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import XCTest
@testable import EscoteiroEspacial

class InfoControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_if_sceneview_have_all_nodes() {
        let infoScreenController = InfoScreenController()
        
        let scene = infoScreenController.addPlanet()
        XCTAssertEqual(scene.rootNode.childNodes.count, 2)

        infoScreenController.astroIdentifier = .sunn
        let scene2 = infoScreenController.addPlanet()
        XCTAssertEqual(scene2.rootNode.childNodes.count, 3)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
