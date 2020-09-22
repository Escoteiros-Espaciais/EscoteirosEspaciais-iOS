//
//  TestOneViewController.swift
//  EscoteiroEspacial
//
//  Created by Paulo Uchôa on 17/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import SceneKit

class TestOneViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var animation: SCNView!
    
    @IBOutlet var tableQuestion: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableQuestion.delegate = self
//        tableQuestion.dataSource = self
//        tableQuestion.reloadData()
        
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
   
        }
}

//extension TestOneViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//
//    }
//}
