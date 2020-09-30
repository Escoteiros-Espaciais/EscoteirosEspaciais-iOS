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
    let sut = QuestionViewController()
    
    override func setUp() {
        sut.planets = [Planets(planet: "neptun", description: "Netuno é o oitavo planeta do Sistema Solar a partir do Sol. É um planeta gasoso, possui atmosfera e um pequeno sistema de anéis, é acompanhado por 14 satélites naturais, sendo o maior deles Tritão.", questions: [ Question(text: "Essa é uma pergunta", rightAnswer: "opção a", answer: ["opção a", "opção b", "opção c"]), Question(text: "Essa é uma pergunta", rightAnswer: "opção a", answer: ["opção a", "opção b", "opção c"])  ])]
   
        sut.astroString = "neptun"
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_selectQuestionAstro_selectAstro_returnNilOrNotNil() {
        let result = sut.selectQuestionsAstro(sut.astroString)
        let result2 = sut.selectQuestionsAstro("plutao")
        XCTAssertNil(result2)
        XCTAssertNotNil(result)
    }
    
    func test_getAnswers_gettingAnswers_returnEqual() {
        sut.astroQuestions = sut.planets[0]
        //when
        let answers: [String] = sut.getAnswers()
        //then
        XCTAssertEqual(answers.count, 3)
    }

    func test_getQuestionText_gettingQuestionText_returnEqual() {

        sut.astroQuestions = sut.planets[0]
        //when
        let text: String = sut.getQuestionText()
        //then
        XCTAssertEqual(text, "Essa é uma pergunta")
    }

//    func test_getProgress_gettingProgress_returnEqual() {
//        let sut = QuestionViewController()
//        //when
//        let result = sut.getProgress(score: 3)
//        //then
//        XCTAssertEqual(result, 0.6)
//    }

    func test_nextQuestion_gettingIndexQuestion_returnEqual() {
        sut.astroQuestions = sut.planets[0]
        let result = sut.nextQuestion()
        XCTAssertEqual(result, 1)
        
        //sut.planets[0].questions = [Question(text: "", rightAnswer: "", answer: []), Question(text: "", rightAnswer: "", answer: [])]
//        let result2 = sut.nextQuestion()
//        XCTAssertEqual(result2, 0)
    }

    func test_getRightAnsewr_gettingRightAnswer_returnEqual() {
        sut.astroQuestions = sut.planets[0]
        let answerOK = sut.getRightAnswer(number: 0)
        //then
        XCTAssertEqual(answerOK, "opção a")
    }
    
    
    func test_checkAnsewr_checkingAnswer_returnFalseOrTrue() {
        sut.astroQuestions = sut.planets[0]
        let userAnswer1 = sut.checkAnswer(userAnswer: "opção a")
        let userAnswer2 = sut.checkAnswer(userAnswer: "Sol")
        //then
        XCTAssertFalse(userAnswer2)
        XCTAssertTrue(userAnswer1)
    }
    
}
