//
//  CometNode.swift
//  EscoteiroEspacial
//
//  Created by PATRICIA S SIQUEIRA on 24/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import SceneKit

class CometNode: SCNNode {
    
    func getComet() {
        let cometParticleSystem = SCNParticleSystem()
        cometParticleSystem.particleImage = UIImage(named: "comet")
        cometParticleSystem.birthDirection = .random
        cometParticleSystem.birthRate = 1
        cometParticleSystem.particleLifeSpan = 2
        cometParticleSystem.particleVelocity = 0.1
        cometParticleSystem.particleSize = 0.2
        
        self.scale = SCNVector3(2,2,2)
        self.addParticleSystem(cometParticleSystem)
        
        let actionFadeOut = SCNAction.fadeOut(duration: 1.0)
        let action = SCNAction.moveBy(x: 2, y: 2, z: 2, duration: 2.0)
        let actionFadeIn = SCNAction.fadeIn(duration: 1.0)
        let actionReverse = SCNAction.moveBy(x: -2, y: -2, z: -2, duration: 2.0)
        let actionSequence = SCNAction.sequence([actionFadeOut, action, actionFadeIn, actionReverse])
        let actionRepeat = SCNAction.repeatForever(actionSequence)
        self.runAction(actionRepeat)
    }
    
}
