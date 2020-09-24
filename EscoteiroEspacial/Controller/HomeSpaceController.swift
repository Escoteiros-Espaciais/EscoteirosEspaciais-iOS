//
//  ViewController.swift
//  EscoteiroEspacial
//
//  Created by Mateus Nobre on 03/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import SceneKit

class HomeSpaceController: UIViewController {
    
    var item = Planets()

    @IBOutlet weak var solButton: UIButton!
    @IBOutlet weak var mercurioButton: UIButton!
    @IBOutlet weak var venusButton: UIButton!
    @IBOutlet weak var luaButton: UIButton!
    @IBOutlet weak var terraButton: UIButton!
    @IBOutlet weak var marteButton: UIButton!
    @IBOutlet weak var jupiterButton: UIButton!
    @IBOutlet weak var saturnoButton: UIButton!
    @IBOutlet weak var uranoButton: UIButton!
    @IBOutlet weak var netunoButton: UIButton!

    @IBOutlet weak var star1View: SCNView!
    @IBOutlet weak var star2View: SCNView!
    @IBOutlet weak var star3View: SCNView!
    @IBOutlet weak var star4View: SCNView!
    
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
        
        star1View.scene = scene
        star1View.backgroundColor = UIColor.clear
        star1View.allowsCameraControl = true
        
        star2View.scene = scene
        star2View.backgroundColor = UIColor.clear
        star2View.allowsCameraControl = true
        
        star3View.scene = scene
        star3View.backgroundColor = UIColor.clear
        star3View.allowsCameraControl = true
        
        star4View.scene = scene
        star4View.backgroundColor = UIColor.clear
        star4View.allowsCameraControl = true
        
        let particleSystem = SCNParticleSystem()
        particleSystem.particleImage = UIImage(named: "star")
        particleSystem.birthDirection = .constant
        particleSystem.birthRate = 50
        particleSystem.particleLifeSpan = 1
        particleSystem.particleColor = .white
        particleSystem.particleSize = 0.06
        particleSystem.speedFactor = 0.8
        particleSystem.emittingDirection = SCNVector3(1,1,1)
        particleSystem.emitterShape = .some(SCNSphere(radius: 5))

        let particlesNode = SCNNode()
        particlesNode.scale = SCNVector3(2,2,2)
        particlesNode.addParticleSystem(particleSystem)
        star1View.scene!.rootNode.addChildNode(particlesNode)
        star2View.scene!.rootNode.addChildNode(particlesNode)
        star3View.scene!.rootNode.addChildNode(particlesNode)
        star4View.scene!.rootNode.addChildNode(particlesNode)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? InfoScreenController else { return }
        guard let identifier = segue.identifier else { return }
        destVC.astroIdentifier = segueStringToAstro(with: identifier)
    }
    // swiftlint:disable:next cyclomatic_complexity
    func segueStringToAstro(with: String) -> Astro {
        switch with {
        case "PassSunInfo":
            return .sunn
        case "PassMercuryInfo":
            return .mercury
        case "PassVenusInfo":
            return .venus
        case "PassMoonInfo":
            return .moon
        case "PassEarthInfo":
            return .earth
        case "PassMarsInfo":
            return .mars
        case "PassJupiterInfo":
            return .jupiter
        case "PassSaturnInfo":
            return .saturn
        case "PassUranInfo":
            return .uran
        case "PassNeptunInfo":
            return .neptun
        default:
            return .unknown
        }
    }
}
