//
//  QuestionViewControllerTests.swift
//  EscoteiroEspacialTests
//
//  Created by Kellyane Nogueira on 25/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import XCTest
@testable import EscoteiroEspacial

class QuestionViewControllerTests: XCTest {
    
    func test_getAnswers_gettingAnswers_returnNotEqual() {
        //given
        let sut = QuestionViewController()
        //when
        let answers: [String] = sut.getAnswers()
        //then
        XCTAssertNotEqual(answers, [])
    }
    
}
