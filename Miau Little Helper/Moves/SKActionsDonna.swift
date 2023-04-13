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
    
    func landDonna(on destination: SKSpriteNode, duration: TimeInterval, offset: CGFloat) -> SKAction {
        
        return SKAction.sequence([
            SKAction.moveTo(y: destination.position.y + destination.frame.height/2 + self.donna.frame.height/2 + offset, duration: duration),
            SKAction.run {
                self.landedSound.run(SKAction.play())
            },
            SKAction.wait(forDuration: 0.3)
        ])
    }
    
    func jumpBelowDonna(jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat, offset: CGFloat) -> SKAction {
        
        SKAction.sequence([
            SKAction.run {
                self.donna.removeAction(forKey: "donnaLampAnimation")
                self.donna.xScale = -1
                self.donna.texture = SKTexture(imageNamed: "walk4")
            },
            SKAction.moveBy(x: distance/10, y: (3 * jumpHeight)/10, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: jumpHeight/4, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: jumpHeight/5, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: (3 * jumpHeight)/20, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: jumpHeight/10, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: -jumpHeight/10, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: -(3 * jumpHeight)/20, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: -jumpHeight/5, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: -jumpHeight/4, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: -(3 * jumpHeight)/10, duration: 0.05),
            SKAction.run {
                self.donna.run(self.landDonna(on: destination, duration: 0.5, offset: offset))
                self.donna.run(SKAction.moveBy(x: distance/5, y: 0, duration: 0.5))
            },
            SKAction.wait(forDuration: 0.5)
        ])
    }
}
