//
//  ViewController.swift
//  EscoteiroEspacial
//
//  Created by Mateus Nobre on 03/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit

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
        
        star3View.scene = scene
        star3View.backgroundColor = UIColor.clear
        
        star4View.scene = scene
        star4View.backgroundColor = UIColor.clear
        
        let starNode = StarNode()
        starNode.getStar()
        star1View.scene!.rootNode.addChildNode(starNode)
        
        let cometNode = CometNode()
        cometNode.getComet()
        star1View.scene!.rootNode.addChildNode(cometNode)
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
