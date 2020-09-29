//
//  TestOneViewController.swift
//  EscoteiroEspacial
//
//  Created by Paulo Uchôa on 17/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import SceneKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var animation: SCNView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
//    @IBOutlet weak var progressBar: UIProgressView!

    var astroString: String = ""
    var questionNumber = 0
    //var score = 0
    
    var model = ApiManager()
    var astroQuestions = Planets()
    var planets: [Planets] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)

        scene.rootNode.addChildNode(cameraNode)

        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .ambient
        lightNode.position = SCNVector3(x: 0, y: 10, z: 2)

        scene.rootNode.addChildNode(lightNode)

        let planetNode = PlanetNode()
        planetNode.getPlanet(planet: astroString)
        scene.rootNode.addChildNode(planetNode)

        animation.scene = scene
        animation.backgroundColor = UIColor.clear
        animation.allowsCameraControl = true
        
        let questionFile = RepositoryQuestion(filename: "question")
        self.planets = questionFile.load()
        
        selectQuestionsAstro(astroString)
        
        updateUI()
    }
    
    func selectQuestionsAstro(_ astro: String) -> Planets? {
        for astroSelected in 0...(planets.count - 1) where planets[astroSelected].planet == astro {
            self.astroQuestions = planets[astroSelected]
            return astroQuestions
        }
        return nil
    }

    // MARK: - Update UI with planet

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!

        let userGotItRight = checkAnswer(userAnswer: userAnswer)

        if userGotItRight {
            sender.backgroundColor = UIColor.systemGreen
            //score += 1
        } else {
            sender.backgroundColor = UIColor.red
        }

        nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @IBAction func backInfo(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func updateUI() {
        
        questionText.text = getQuestionText()

        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
    
    func getQuestionText() -> String {
        guard let text = astroQuestions.questions![questionNumber].text else {return ""}
        return text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        guard let answers = astroQuestions.questions![questionNumber].answer else {return []}
        return answers
    }

    func nextQuestion() -> Int {
        if questionNumber < (astroQuestions.questions!.count - 1) {
            questionNumber += 1
            return questionNumber
        } else {
            questionNumber = 0
            return questionNumber
        }
    }

    func getRightAnswer(number: Int) -> String {
        if let answerOk = astroQuestions.questions![number].rightAnswer {
            return answerOk
        } else {
            return ""
        }
    }
    
    func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        let answerOk = getRightAnswer(number: questionNumber)
        if (answerOk != "") && (userAnswer == answerOk) {
            return true
        } else {
            return false
        }
    }
    
}
