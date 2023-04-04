//
//  SKActions1D.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 02/04/23.
//

import SpriteKit

extension GameScene {
    
    func rightBorder(of node: SKSpriteNode, offset: CGFloat ,duration: TimeInterval) -> SKAction {
        
        return SKAction.sequence([
            right,
            SKAction.moveTo(x: node.position.x + node.frame.width/2 - nina.frame.width/2 - offset, duration: duration),
            stop
        ])
    }
    
    func leftBorder(of node: SKSpriteNode,offset: CGFloat, duration: TimeInterval) -> SKAction {
        
        
        return SKAction.sequence([
            left,
            SKAction.moveTo(x: node.position.x - node.frame.width/2 + nina.frame.width/2 + offset, duration: duration),
            stop
        ])
    }
    
    func land(on destination: SKSpriteNode, duration: TimeInterval) -> SKAction {
        
        return SKAction.sequence([
            SKAction.moveTo(y: destination.position.y + destination.frame.height/2 + self.nina.frame.height/2, duration: duration),
            SKAction.run {
                self.landedSound.run(SKAction.play())
            },
            SKAction.animate(with: ninaLandingTexture, timePerFrame: 0.08),
            SKAction.setTexture(ninaAtlas.textureNamed("nina1"))
            
        ])
    }
}
