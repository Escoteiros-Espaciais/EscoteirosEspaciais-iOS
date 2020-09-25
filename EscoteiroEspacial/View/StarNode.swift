//
//  StarNode.swift
//  EscoteiroEspacial
//
//  Created by PATRICIA S SIQUEIRA on 24/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import SceneKit

class StarNode: SCNNode {
    func getStar() {
        let particleSystem = SCNParticleSystem()
        particleSystem.particleImage = UIImage(named: "star")
        particleSystem.birthDirection = .random
        particleSystem.birthRate = 50
        particleSystem.particleLifeSpan = 1
        particleSystem.particleColor = .white
        particleSystem.particleSize = 0.06
        particleSystem.speedFactor = 0.8
        particleSystem.emittingDirection = SCNVector3(1,1,1)
        particleSystem.emitterShape = .some(SCNSphere(radius: 5))
        
        self.scale = SCNVector3(2,2,2)
        self.addParticleSystem(particleSystem)
    }

}
