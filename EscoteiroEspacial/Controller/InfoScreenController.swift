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

class InfoScreenController: UIViewController {
   
    @IBOutlet weak var backButon: UIButton!
    @IBOutlet weak var testeButton: UIButton!

    @IBOutlet weak var microAnimation: AnimationView!
    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var descriptionText: UILabel!
    
    var astroIdentifier: Astro?
    var planets: [Planets] = []
    
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
        microAnimation.loopMode = .loop
        microAnimation.animationSpeed = 0.5
        microAnimation.play()
        
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

}
