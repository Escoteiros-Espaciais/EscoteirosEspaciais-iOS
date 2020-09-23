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

        sceneView.scene = scene
        sceneView.backgroundColor = UIColor.clear
        sceneView.allowsCameraControl = true
        
        backButon.addTarget(self, action: #selector(setter: backButon), for: .touchUpInside)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toQuiz") {
            guard let destVC = segue.destination as? QuestionViewController else { return }
            destVC.astroIdentifier = self.astroIdentifier
        }
    }

}
