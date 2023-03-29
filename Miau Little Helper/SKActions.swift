//
//  SKActions.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 28/03/23.
//

import SpriteKit

extension GameScene {
    
    func land(on destination: SKSpriteNode, duration: TimeInterval) -> SKAction {
        return SKAction.moveTo(y: destination.position.y + destination.frame.height/2 + self.nina.frame.height/2, duration: duration)
    }
    
    func rightBorder(of node: SKSpriteNode, offset: CGFloat ,duration: TimeInterval) -> SKAction {
        
        return SKAction.sequence([
            SKAction.run {
            self.nina.xScale = 1.0
            self.nina.run(self.walk, withKey: "ninaMoveAnimation")
        },
            SKAction.moveTo(x: node.position.x + node.frame.width/2 - nina.frame.width/2 - offset, duration: duration),
            SKAction.run {
                self.nina.removeAction(forKey: "ninaMoveAnimation")
            }
                          ])
    }
    
    func leftBorder(of node: SKSpriteNode,offset: CGFloat, duration: TimeInterval) -> SKAction {
        
        
        return SKAction.sequence([
            SKAction.run {
                self.nina.xScale = -1.0
                self.nina.run(self.walk, withKey: "ninaMoveAnimation")
            },
            SKAction.moveTo(x: node.position.x - node.frame.width/2 + nina.frame.width/2 + offset, duration: duration),
            SKAction.run {
                self.nina.removeAction(forKey: "ninaMoveAnimation")
                //jump animation?
            }
        ])
    }
    
    func jumpBelow(jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat) -> SKAction {
        
        
        SKAction.sequence([
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
                self.nina.run(SKAction.moveTo(y: destination.position.y + destination.frame.height/2 + self.nina.frame.height/2, duration: 0.5))
                self.nina.run(SKAction.moveBy(x: distance/5, y: 0, duration: 0.5))
            },
            SKAction.wait(forDuration: 0.5)
        ])
    }
    
    func goRightandJumpBelow(of node: SKSpriteNode, offset: CGFloat ,duration: TimeInterval, jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat) -> SKAction{
        return SKAction.sequence([
        rightBorder(of: node, offset: offset, duration: duration),
        jumpBelow(jumpHeight: jumpHeight, destination: destination, distance: distance)
        ])
    }
    
    func goLeftandJumpBelow(of node: SKSpriteNode, offset: CGFloat ,duration: TimeInterval, jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat) -> SKAction{
        return SKAction.sequence([
        leftBorder(of: node, offset: offset, duration: duration),
        jumpBelow(jumpHeight: jumpHeight, destination: destination, distance: -distance)
        ])
    }
    
    
    var left : SKAction {
        let left = SKAction.run {
            self.nina.xScale = -1.0
            self.nina.run(self.walk, withKey: "ninaMoveAnimation")
        }
        
        return left
    }
    
    var right : SKAction {
        let right = SKAction.run {
            self.nina.xScale = 1.0
            self.nina.run(self.walk, withKey: "ninaMoveAnimation")
        }
        
        return right
    }
    
    var stop : SKAction {
        let stop = SKAction.run {
            self.nina.removeAction(forKey: "ninaMoveAnimation")
            //jump animation?
        }
        
        return stop
    }
    
    //MARK: - Specific Movements - Bedroom
    
    var shelfWallToBed : SKAction {
        
        
        let shelfWalltoBed = SKAction.sequence([
            goRightandJumpBelow(of: shelfWall, offset: 0, duration: 1, jumpHeight: 300, destination: shelfWall2, distance: 400),
            goLeftandJumpBelow(of: shelfWall2, offset: 0, duration: 1, jumpHeight: 200, destination: shelfWall3, distance: 400),
            goRightandJumpBelow(of: shelfWall3, offset: 0, duration: 1, jumpHeight: 200, destination: bed, distance: 300)
        ])
        
        return shelfWalltoBed
    }
    
    var bedToFloor : SKAction {
        let bedToFloor = goRightandJumpBelow(of: bed, offset: 500, duration: 1, jumpHeight: 200, destination: floor, distance: 500)

        return bedToFloor
    }
    
    
    //MARK: - Specific Movements - Living Room
    
    
    
    //MARK: - Specific Movements - Kitchen
}
