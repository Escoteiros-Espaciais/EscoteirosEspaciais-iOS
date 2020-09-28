//
//  TestTwoViewController.swift
//  EscoteiroEspacial
//
//  Created by Kellyane Nogueira on 22/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class QuestionTwoViewController: UIViewController { //Mudar nome para QuestionTwo
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var viewQuestion: UIView!
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var option1: UIImageView!
    @IBOutlet weak var option2: UIImageView!
    @IBOutlet weak var option3: UIImageView!
    @IBOutlet weak var option4: UIImageView!
    @IBOutlet weak var answer: UIImageView!
    
    var dynamicAnimator: UIDynamicAnimator!
    var snapBehavior: UISnapBehavior!
    
    var astros: [Planets] = []
    var options: [UIImageView] = []
    var answerRight: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var info = InfoScreenController()
//        let astroName:String = info.astroIdentifier?.rawValue ?? ""
//
//        let planetNode = PlanetNode()
//        planetNode.getPlanet(planet: astroName)
        
        option1.image = UIImage(named: "Marte")
        option2.image = UIImage(named: "Mercurio")
        option3.image = UIImage(named: "Netuno")
        option4.image = UIImage(named: "Jupiter")
        answer.image = UIImage(named: "EsferaVazia")
        options = [option1, option2, option3, option4]
        
        question.text = "Alguma pergunta para arrastar um planeta"
        answerRight = "Netuno"
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        answer.isUserInteractionEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for option in options {
            snapBehaviorInImage(image: option)
        }
    }
    
    func snapBehaviorInImage(image: UIImageView) {
        snapBehavior = UISnapBehavior(item: image, snapTo: image.center)
        image.isUserInteractionEnabled = true
        //dynamicAnimator.addBehavior(snapBehavior)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pannedView))
        image.addGestureRecognizer(panGesture)
    }
    
    @objc func pannedView(recognizer: UIPanGestureRecognizer) {
        var element = recognizer.view?.center ?? .zero
        var object = recognizer.view!
        
        switch recognizer.state {
        case .began:
           dynamicAnimator.removeBehavior(snapBehavior)
           element = object.center
        case .changed:
            let translation = recognizer.translation(in: view)
            let moved = CGPoint(x: element.x + translation.x, y: element.y + translation.y)
            object.center = moved
           recognizer.setTranslation(.zero, in: view)
            
           checkIntersectionWith(image: object)
        case .ended, .cancelled, .failed:
            dynamicAnimator.addBehavior(snapBehavior)
            
        case .possible:
            break
        }
    }
    
    func checkIntersectionWith(image: UIView) {
        if answer.frame.contains(image.center) {
            snapBehavior.snapPoint = answer.center
        }
    }
    
    func selectedImageName(name: String) -> String {
        switch name {
        case "PassSunInfo":
            return "Sol"
//        case "PassMercuryInfo":
//            return .mercury
//        case "PassVenusInfo":
//            return .venus
//        case "PassMoonInfo":
//            return .moon
//        case "PassEarthInfo":
//            return .earth
//        case "PassMarsInfo":
//            return .mars
//        case "PassJupiterInfo":
//            return .jupiter
//        case "PassSaturnInfo":
//            return .saturn
//        case "PassUranInfo":
//            return .uran
//        case "PassNeptunInfo":
//            return .neptun
        default:
            return ""
        }
    }
    
    func getQuestions(astro: String) -> Planets {
        let questionVC = QuestionViewController()
        let quiz = questionVC.astroQuestions[0]

        return quiz
    }
    
//    func getOptions() {
//        var questions = getQuestions(astro: <#T##String#>)
//        for i in questions.questions! {
//            var items = i.answer
//        }
//    }
    
}
