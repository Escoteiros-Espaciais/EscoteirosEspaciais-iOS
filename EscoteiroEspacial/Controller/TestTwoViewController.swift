//
//  TestTwoViewController.swift
//  EscoteiroEspacial
//
//  Created by Kellyane Nogueira on 22/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class TestTwoViewController: UIViewController { //Mudar nome para QuestionTwo
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var viewQuestion: UIView!
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var option1: UIImageView!
    @IBOutlet weak var option2: UIImageView!
    @IBOutlet weak var option3: UIImageView!
    @IBOutlet weak var option4: UIImageView!
    @IBOutlet weak var answer: UIImageView!
    
    var answerRight: String = ""
    
    var dynamicAnimator: UIDynamicAnimator!
    var snapBehavior: UISnapBehavior!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        option1.image = UIImage(named: "Marte")
        option2.image = UIImage(named: "Mercurio")
        option3.image = UIImage(named: "Netuno")
        option4.image = UIImage(named: "Jupiter")
        answer.image = UIImage(named: "EsferaVazia")
        
        question.text = "Alguma pergunta para arrastar um planeta"
        answerRight = "Netuno"
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        answer.isUserInteractionEnabled = false
        
        snapBehaviorInImage(image: option1)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pannedView))
        option1.addGestureRecognizer(panGesture)
        
//        snapBehaviorInImage(image: option2)
//        snapBehaviorInImage(image: option3)
//        snapBehaviorInImage(image: option4)
       
    }
    
    func snapBehaviorInImage(image: UIImageView) {
        snapBehavior = UISnapBehavior(item: image, snapTo: image.center) //Change position
        image.isUserInteractionEnabled = true
        dynamicAnimator.addBehavior(snapBehavior)
    }
    
    @objc func pannedView(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            dynamicAnimator.removeBehavior(snapBehavior)
        case .changed:
            let translation = recognizer.translation(in: view)
            option1.center = CGPoint(x: option1.center.x + translation.x, y: option1.center.y + translation.y)
            recognizer.setTranslation(.zero, in: view)
            
            checkIntersectionWith(image: option1)
        case .ended, .cancelled, .failed:
            dynamicAnimator.addBehavior(snapBehavior)
        case .possible:
            break
        }
    }
    
    func checkIntersectionWith(image: UIView) {
        if answer.frame.contains(image.center) {
            snapBehavior.snapPoint = answer.center
        } else {
            snapBehavior.snapPoint = image.center
        }
    }
    
}
