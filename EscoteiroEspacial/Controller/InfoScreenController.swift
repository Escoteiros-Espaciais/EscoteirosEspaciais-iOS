//
//  InfoScreenController.swift
//  EscoteiroEspacial
//
//  Created by Mateus Nobre on 10/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import SceneKit
import Lottie
import AVFoundation

class InfoScreenController: UIViewController {
   
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var testeButton: UIButton!

    @IBOutlet weak var microAnimation: AnimationView!
    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var descriptionText: UILabel!
    
    var astroIdentifier: Astro?
    var planets: [Planets] = []
    
    var soundPlanet = Sounds()
    var audioOn: Bool = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        sceneView.scene = addPlanet()
        
        sceneView.backgroundColor = UIColor.clear
        sceneView.allowsCameraControl = true
        
        let questionFile = RepositoryQuestion(filename: "question")
        self.planets = questionFile.load()
        
        guard let astroIdentifier = astroIdentifier else {return}
        descriptionText.text = selectDescriptionAstro(astroIdentifier.rawValue)
        
        microAnimation.frame = view.bounds
        microAnimation.contentMode = .scaleToFill
        microAnimation.isUserInteractionEnabled = true
        microAnimation.animationSpeed = 0.5
        microAnimation.currentFrame = 28
        addToggleRecognizer(microAnimation)
    }
    
    func addToggleRecognizer(_ animationView: AnimationView) {
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleMenu(recognizer:)))
            animationView.addGestureRecognizer(tapRecognizer)
        }
   
    @objc func toggleMenu(recognizer: UITapGestureRecognizer) {
            audioOn ? startSound() : finishSound()
            audioOn = !audioOn
        }
    
    func addPlanet() -> SCNScene {
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
        guard let astroIdentifier = astroIdentifier else {return scene}
        planetNode.getPlanet(planet: astroIdentifier.rawValue)
        scene.rootNode.addChildNode(planetNode)
        return scene
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? QuestionViewController else { return }
        guard let astroIdentifier = astroIdentifier else {return}
        destVC.astroString = astroIdentifier.rawValue
    }
    
    func selectDescriptionAstro(_ astro: String) -> String {
        for astroSelected in 0...(planets.count - 1) where planets[astroSelected].planet == astro {
            guard let planetDescription = planets[astroSelected].description else {return ""}
            return planetDescription
        }
        return ""
    }
    
    private func startSound() {
        microAnimation.play(fromFrame: ProgressKeyFrames.start.rawValue, toFrame: ProgressKeyFrames.finished.rawValue, loopMode: .none) { [weak self] (_) in
            guard let astroIdentifier = self!.astroIdentifier else {return}
            self?.soundPlanet.myAudio(astroIdentifier).play()
        }
    }
    private func finishSound() {
        microAnimation?.play(fromFrame: ProgressKeyFrames.first.rawValue, toFrame: ProgressKeyFrames.clouse.rawValue, loopMode: .none) { [weak self] (_) in
            guard let astroIdentifier = self!.astroIdentifier else {return}
            self?.soundPlanet.myAudio(astroIdentifier).pause()
        }

    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
}

