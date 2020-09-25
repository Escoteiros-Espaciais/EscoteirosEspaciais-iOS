//
//  InfoScreenController.swift
//  EscoteiroEspacial
//
//  Created by Mateus Nobre on 10/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import SceneKit

class InfoScreenController: UIViewController {
   
    @IBOutlet weak var backButon: UIButton!
    @IBOutlet weak var testeButton: UIButton!
    @IBOutlet weak var onOffButton: UIButton!
    @IBOutlet weak var sceneView: SCNView!
    var astroIdentifier: Astro?
    var astroString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.scene = addPlanet()
        
        sceneView.backgroundColor = UIColor.clear
        sceneView.allowsCameraControl = true
        
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
        destVC.astroString = astroIdentifier.rawValue//segueAstroToString(with: astroIdentifier)
    }

}
