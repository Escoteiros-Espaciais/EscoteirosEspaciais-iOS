//
//  PlanetNode.swift
//  EscoteiroEspacial
//
//  Created by Mateus Nobre on 17/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import SceneKit

class PlanetNode: SCNNode {
    
    func getPlanet(planet: String) {
        if planet == "saturn"{
            let ringPlanet = SCNTorus(ringRadius: 2.1, pipeRadius: 0.10)
            let ringNode = SCNNode(geometry: ringPlanet)
            ringPlanet.firstMaterial?.diffuse.contents = UIImage(named: "saturnringcolor")
            ringPlanet.firstMaterial?.specular.contents = UIImage(named: "saturnringpattern")
            ringNode.runAction(SCNAction.repeatForever(SCNAction.rotate(by: 360 * CGFloat(Double.pi/180), around: SCNVector3(0, 1, 0), duration: 12)))
            addChildNode(ringNode)
        }
        if planet == "uran"{
            let ringPlanet = SCNTorus(ringRadius: 2.1, pipeRadius: 0.03)
            let ringNode = SCNNode(geometry: ringPlanet)
            ringPlanet.firstMaterial?.diffuse.contents = UIImage(named: "uranringcolor")
            ringPlanet.firstMaterial?.specular.contents = UIImage(named: "uranringpattern")
            ringNode.runAction(SCNAction.repeatForever(SCNAction.rotate(by: 360 * CGFloat(Double.pi/180), around: SCNVector3(0, 1, 0), duration: 12)))
            addChildNode(ringNode)
        }
        
        self.geometry = SCNSphere(radius: 1.7)
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: planet)
        self.geometry?.firstMaterial?.shininess = 50
        
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi/180), around: SCNVector3(0, 1, 0), duration: 12)
        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
        
    }
    
}
