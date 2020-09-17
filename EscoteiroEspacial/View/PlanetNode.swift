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
    
    override init() {
        super.init()
        self.geometry = SCNSphere(radius: 1.5)
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "Diffuse")
//        self.geometry?.firstMaterial?.specular.contents = UIImage(named: "Specular")
//        self.geometry?.firstMaterial?.emission.contents = UIImage(named: "Emission")
//        self.geometry?.firstMaterial?.normal.contents = UIImage(named: "Normal")
        
        self.geometry?.firstMaterial?.shininess = 50
        
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi/180), around: SCNVector3(0, 1, 0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
