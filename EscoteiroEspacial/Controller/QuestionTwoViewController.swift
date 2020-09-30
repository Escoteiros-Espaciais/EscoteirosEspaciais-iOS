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

    var options: [UIImageView] = []
    var text = ""
    var answerRight = ""
    //var imageRight = UIImageView()
    var items: [String] = []
    var score = 0
    
    var behaviors: [Int : UISnapBehavior] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        question.text = text
        answer.image = UIImage(named: "EsferaVazia")
        option1.image = UIImage(named: items[0])
        option2.image = UIImage(named: items[1])
        option3.image = UIImage(named: items[2])
        option4.image = UIImage(named: items[3])
        options = [option1, option2, option3, option4]
        //imageRight.image = UIImage(named: answerRight)
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        answer.isUserInteractionEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for (index, option) in options.enumerated() {
            option.tag = index
            snapBehaviorInImage(image: option)
        }
    }
    
    func snapBehaviorInImage(image: UIImageView) {
        behaviors[image.tag] = UISnapBehavior(item: image, snapTo: image.center)
        image.isUserInteractionEnabled = true
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pannedView))
        image.addGestureRecognizer(panGesture)
    }
    
    @objc func pannedView(recognizer: UIPanGestureRecognizer) {
        var element = recognizer.view?.center ?? .zero
        let object = recognizer.view!
        
        guard let behavior = behaviors[object.tag] else { return }
        
        switch recognizer.state {
        case .began:
           dynamicAnimator.removeBehavior(behavior)
           element = object.center
        case .changed:
            let translation = recognizer.translation(in: view)
            let moved = CGPoint(x: element.x + translation.x, y: element.y + translation.y)
            object.center = moved
            recognizer.setTranslation(.zero, in: view)
            
           checkIntersectionWith(image: object, behavior: behavior)
        case .ended, .cancelled, .failed:
            dynamicAnimator.addBehavior(behavior)
            
        case .possible:
            break
        @unknown default:
            break
        }
    }
    
    func itemRigth(answer: String) -> Int {
        for (index, item) in items.enumerated() {
            if answer == item {
                return index
            }
        }
        return 0
    }
    
    func checkImageAnswer(image: UIView) {
        if image.tag == itemRigth(answer: answerRight) {
            score+=1
            print("acertou")
            answer.image = UIImage(named: "EsferaCerta")
        } else {
            print("errou")
            answer.image = UIImage(named: "EsferaErrada")
        }
    }
    
    func checkIntersectionWith(image: UIView, behavior: UISnapBehavior) {
        if answer.frame.contains(image.center) {
            behavior.snapPoint = answer.center
            checkImageAnswer(image: image)
            
            let storyboard = UIStoryboard(name: "Warnings", bundle: nil)
            let warningsVC = storyboard.instantiateViewController(identifier: "warnings") as WarningsViewController
            warningsVC.score = score
            self.present(warningsVC, animated: true, completion: nil)
        }
    }

}
