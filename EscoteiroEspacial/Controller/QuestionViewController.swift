//
//  TestOneViewController.swift
//  EscoteiroEspacial
//
//  Created by Paulo Uchôa on 17/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import SceneKit

class QuestionViewController: UIViewController, QuestionDelegate {
   
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var animation: SCNView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //var astroIdentifier: Astro?
    var questionNumber = 0
    var score = 0
    
    var questions = [Question]()
    var model = ApiManager()
    
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
        scene.rootNode.addChildNode(planetNode)

        animation.scene = scene
        animation.backgroundColor = UIColor.clear
        animation.allowsCameraControl = true
        
        model.delegate = self
        model.getQuestions()
        
        updateUI()
    }
    
    // MARK: - Model Delegate Methods
    func questionFetched(_ questions: [Question]) {
        
        self.questions = questions
    }
    
    // MARK: - Update UI with planet
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionText.text = getQuestionText()
        
        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = getProgress()
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
    
    func getQuestionText() -> String? {
        return questions[1].text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        guard let answers = questions[1].answer else {return []}
        return answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(questions.count)
    }
    
    func nextQuestion() {
        if questionNumber + 1 < questions.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == questions[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
}
