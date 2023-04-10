//
//  SKActions2D.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 02/04/23.
//

import SpriteKit

extension GameScene {
    
    func jumpBelow(jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat, leftOrRight: String) -> SKAction {
        
        
        SKAction.sequence([
            getReadyToJump,
            SKAction.moveBy(x: distance/10, y: (3 * jumpHeight)/10, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: jumpHeight/4, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: jumpHeight/5, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: (3 * jumpHeight)/20, duration: 0.05),
            goingDown(leftOrRight: leftOrRight),
            SKAction.moveBy(x: distance/10, y: jumpHeight/10, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: -jumpHeight/10, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: -(3 * jumpHeight)/20, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: -jumpHeight/5, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: -jumpHeight/4, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: -(3 * jumpHeight)/10, duration: 0.05),
            SKAction.run {
                self.nina.run(self.land(on: destination, duration: 0.5))
                self.nina.run(SKAction.moveBy(x: distance/5, y: 0, duration: 0.5))
            },
            SKAction.wait(forDuration: 0.5)
        ])
    }
    
    func jumpUpward(of origin: SKSpriteNode,jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat, slider: CGFloat, leftOrRight : String) -> SKAction {
        
        let trueHeight = (destination.position.y + destination.frame.height/2 + jumpHeight) - (origin.position.y + origin.frame.height/2)
        
        return SKAction.sequence([
            getReadyToJump,
            SKAction.moveBy(x: distance/10, y: (3 * trueHeight)/10, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: trueHeight/4, duration: 0.06),
            SKAction.moveBy(x: distance/10, y: trueHeight/5, duration: 0.07),
            SKAction.moveBy(x: distance/10, y: (3 * trueHeight)/20, duration: 0.08),
            SKAction.moveBy(x: distance/10, y: trueHeight/10, duration: 0.1),
            goingDown(leftOrRight: leftOrRight),
            SKAction.moveBy(x: distance/10, y: -jumpHeight/10, duration: 0.08),
            SKAction.moveBy(x: distance/10, y: -(3 * jumpHeight)/20, duration: 0.07),
            SKAction.moveBy(x: distance/10, y: -jumpHeight/5, duration: 0.06),
            SKAction.moveBy(x: distance/10, y: -jumpHeight/4, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: -(2 * jumpHeight)/10, duration: 0.05),
            SKAction.run {
                self.nina.run(self.land(on: destination, duration: 0.05))
                self.nina.run(SKAction.moveBy(x: distance/20, y: 0, duration: 0.05))
            },
            SKAction.wait(forDuration: 0.05),
            SKAction.moveBy(x: slider, y: 0, duration: 0.5),
            SKAction.wait(forDuration: 0.5)
        ])
    }
    
    func goRightandJumpUpward(of node: SKSpriteNode, offset: CGFloat, duration: TimeInterval, jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat, slider: CGFloat) -> SKAction {
        return SKAction.sequence([
            rightBorder(of: node, offset: offset, duration: duration),
            jumpUpward(of: node, jumpHeight: jumpHeight, destination: destination, distance: distance, slider: slider, leftOrRight: "right"),
            SKAction.wait(forDuration: 0.5)
        ])
    }
    
    func goLeftandJumpUpward(of node: SKSpriteNode, offset: CGFloat, duration: TimeInterval, jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat, slider: CGFloat) -> SKAction {
        return SKAction.sequence([
            leftBorder(of: node, offset: offset, duration: duration),
            jumpUpward(of: node, jumpHeight: jumpHeight, destination: destination, distance: -distance, slider: -slider, leftOrRight: "left"),
        ])
    }
    
    func goRightandJumpBelow(of node: SKSpriteNode, offset: CGFloat ,duration: TimeInterval, jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat) -> SKAction {
        return SKAction.sequence([
            rightBorder(of: node, offset: offset, duration: duration),
            jumpBelow(jumpHeight: jumpHeight, destination: destination, distance: distance, leftOrRight: "right"),
        ])
    }
    
    func goLeftandJumpBelow(of node: SKSpriteNode, offset: CGFloat ,duration: TimeInterval, jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat) -> SKAction {
        return SKAction.sequence([
            leftBorder(of: node, offset: offset, duration: duration),
            jumpBelow(jumpHeight: jumpHeight, destination: destination, distance: -distance, leftOrRight: "left"),
        ])
    }
    
}
