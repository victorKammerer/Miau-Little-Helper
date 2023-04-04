//
//  SKActionsSounds.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 02/04/23.
//

import SpriteKit

extension GameScene {
    var stepsAudio : SKAction {
        let steps = SKAction.sequence([
//            SKAction.wait(forDuration: 0.61),
            SKAction.run {
                self.stepsSound1.run(SKAction.play())
            },
            SKAction.wait(forDuration: 0.61),
            SKAction.run {
                self.stepsSound2.run(SKAction.play())
            },
            SKAction.wait(forDuration: 0.61),

        ])
        return SKAction.repeatForever(steps)
    }
    
}
