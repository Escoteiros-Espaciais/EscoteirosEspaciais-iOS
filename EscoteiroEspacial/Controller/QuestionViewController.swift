//
//  TestOneViewController.swift
//  EscoteiroEspacial
//
//  Created by Paulo Uchôa on 17/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import SceneKit

class QuestionViewController: UIViewController, SCNSceneRendererDelegate {
    
    @IBOutlet weak var backInfoButton: UIButton!
    @IBOutlet weak var animation: SCNView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!

    var astroString: String = ""
    var questionNumber = 0
    var score = 0
    
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
        animation.delegate = self
        
        let questionFile = RepositoryQuestion(filename: "question")
        self.planets = questionFile.load()
        
        selectQuestionsAstro(astroString)
        
        updateUI()
    }
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        //let point = self.animation.pointOfView
        guard let viewCamera = self.animation.pointOfView?.camera?.yFov else {return}
        if viewCamera <= 40 {
            self.animation.pointOfView?.camera?.yFov = 40
        }
        if viewCamera >= 80 {
            self.animation.pointOfView?.camera?.yFov = 80
        }
        
       // print(self.animation.pointOfView?.camera?.yFov)
//        if sceneView.projectPoint(planetNode.position).x != 182.0 {
//            self.sceneView.pointOfView = point
//
//        }
//
//        print(sceneView.pointOfView)
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
            score += 1
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
    
    func nextQuestion() -> Int {
        if questionNumber <= (astroQuestions.questions!.count - 1) {
            questionNumber += 1
            if questionNumber == 4 {
                
                let storyboard = UIStoryboard(name: "QuestionTwo", bundle: nil)
                let questionTwoVC = storyboard.instantiateViewController(identifier: "questionTwo") as QuestionTwoViewController
                questionTwoVC.text = getQuestionText()
                questionTwoVC.answerRight = getRightAnswer(number: questionNumber)
                questionTwoVC.items = getAnswers()
                questionTwoVC.score = score
                questionTwoVC.planetName = astroQuestions.planet!
                self.present(questionTwoVC, animated: true, completion: nil)
               
            }
            return questionNumber
        }
        return questionNumber
    }
    
}
