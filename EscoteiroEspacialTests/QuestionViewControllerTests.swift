//
//  QuestionViewControllerTests.swift
//  EscoteiroEspacialTests
//
//  Created by Kellyane Nogueira on 26/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import XCTest
@testable import EscoteiroEspacial

class QuestionViewControllerTests: XCTestCase {
    
    func test_getAnswers_gettingAnswers_returnNotEqual() {
        //given
        let sut = QuestionViewController()
        //when
        let answers: [String] = sut.getAnswers()
        //then
        XCTAssertNotEqual(answers, [])
    }
    
    func test_getQuestionText_gettingQuestionText_returnNotEqual() {
        let sut = QuestionViewController()
        let text: String = sut.getQuestionText()
        XCTAssertNotEqual(text, "")
    }
    
    func test_getProgress_gettingProgress_returnEqual() {
        let sut = QuestionViewController()
        //when
        let result = sut.getProgress(score: 3)
        //then
        XCTAssertEqual(result, 0.6)
    }
    
    func test_nextQuestion_gettingIndexQuestion_returnNotEqual() {
        let sut = QuestionViewController()
        let questionNumber = sut.questionNumber
        XCTAssertNotEqual(questionNumber, 0)
    }
    
//    func test_getRightAnsewr_gettingRightAnswer_returnEqual() {
//        let sut = QuestionViewController()
//        let answerOK = sut.getRightAnswer(number: 2)
//        //then
//        XCTAssertEqual(answerOK, "Sol")
//    }
//    
//    
//    func test_checkAnsewr_checkingAnswer_returnFalseOrTrue() {
//        let sut = QuestionViewController()
//        //when
//        _ = sut.getRightAnswer(number: 2, astro: ) //De qual astro?
//        let userAnswer1 = sut.checkAnswer(userAnswer: "Lua")
//        let userAnswer2 = sut.checkAnswer(userAnswer: "Sol")
//        //then
//        XCTAssertFalse(userAnswer1)
//        XCTAssertTrue(userAnswer2)
//    }
    
}
