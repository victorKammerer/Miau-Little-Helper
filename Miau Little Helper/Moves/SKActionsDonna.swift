//
//  SKActionsDonna.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 10/04/23.
//

import SpriteKit

extension GameScene {
    
    var walkDonna : SKAction {
        let textureAnimation = SKAction.animate(with: self.donnaMovementTexture, timePerFrame: 0.1)
        let walk = SKAction.repeatForever(textureAnimation)
        
        return walk
    }
    
    var leftDonna : SKAction {
        let left = SKAction.run {
            self.donna.xScale = -1.0
            self.donna.run(self.walkDonna, withKey: "donnaMoveAnimation")
            self.donna.run(self.stepsAudio, withKey: "donnaStepAudio")
        }
        
        return left
    }
    
    var rightDonna : SKAction {
        let right = SKAction.run {
            self.donna.xScale = 1.0
            self.donna.run(self.walkDonna, withKey: "donnaMoveAnimation")
            self.donna.run(self.stepsAudio, withKey: "donnaStepAudio")
        }
        
        return right
    }
    
    var stopDonna : SKAction {
        let stop = SKAction.run {
            self.donna.removeAction(forKey: "donnaMoveAnimation")
            self.donna.removeAction(forKey: "donnaStepAudio")
            self.stepsSound1.run(SKAction.stop())
            self.stepsSound2.run(SKAction.stop())
//            self.nina.run(SKAction.stop())
            //jump animation?
        }
        
        return stop
    }
    
    func rightBorderDonna(of node: SKSpriteNode, offset: CGFloat ,duration: TimeInterval) -> SKAction {
        
        return SKAction.sequence([
            rightDonna,
            SKAction.moveTo(x: node.position.x + node.frame.width/2 - donna.frame.width/2 - offset, duration: duration),
            stopDonna
        ])
    }
    
    func leftBorderDonna(of node: SKSpriteNode,offset: CGFloat, duration: TimeInterval) -> SKAction {
        
        
        return SKAction.sequence([
            leftDonna,
            SKAction.moveTo(x: node.position.x - node.frame.width/2 + donna.frame.width/2 + offset, duration: duration),
            stopDonna
        ])
    }
    
    
}
