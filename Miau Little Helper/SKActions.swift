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
            right,
            SKAction.moveTo(x: node.position.x + node.frame.width/2 - nina.frame.width/2 - offset, duration: duration),
            SKAction.run {
                self.nina.removeAction(forKey: "ninaMoveAnimation")
            }
                          ])
    }
    
    func leftBorder(of node: SKSpriteNode,offset: CGFloat, duration: TimeInterval) -> SKAction {
        
        
        return SKAction.sequence([
            left,
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
                self.nina.run(self.land(on: destination, duration: 0.5))
                self.nina.run(SKAction.moveBy(x: distance/5, y: 0, duration: 0.5))
            },
            SKAction.wait(forDuration: 0.5)
        ])
    }
    
    func jumpUpward(of origin: SKSpriteNode,jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat, slider: CGFloat) -> SKAction {
        
        let trueHeight = (destination.position.y + destination.frame.height/2 + jumpHeight) - (origin.position.y + origin.frame.height/2)
        
        return SKAction.sequence([
            SKAction.moveBy(x: distance/10, y: (3 * trueHeight)/10, duration: 0.05),
            SKAction.moveBy(x: distance/10, y: trueHeight/4, duration: 0.06),
            SKAction.moveBy(x: distance/10, y: trueHeight/5, duration: 0.07),
            SKAction.moveBy(x: distance/10, y: (3 * trueHeight)/20, duration: 0.08),
            SKAction.moveBy(x: distance/10, y: trueHeight/10, duration: 0.1),
            //MARK
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
            SKAction.moveBy(x: slider, y: 0, duration: 0.5)
        ])
    }
    
    func goRightandJumpUpward(of node: SKSpriteNode, offset: CGFloat, duration: TimeInterval, jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat, slider: CGFloat) -> SKAction {
        return SKAction.sequence([
        rightBorder(of: node, offset: offset, duration: duration),
        jumpUpward(of: node, jumpHeight: jumpHeight, destination: destination, distance: distance, slider: slider)
        ])
    }
    
    func goLeftandJumpUpward(of node: SKSpriteNode, offset: CGFloat, duration: TimeInterval, jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat, slider: CGFloat) -> SKAction {
        return SKAction.sequence([
        leftBorder(of: node, offset: offset, duration: duration),
        jumpUpward(of: node, jumpHeight: jumpHeight, destination: destination, distance: -distance, slider: -slider)
        ])
    }
    
    func goRightandJumpBelow(of node: SKSpriteNode, offset: CGFloat ,duration: TimeInterval, jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat) -> SKAction {
        return SKAction.sequence([
        rightBorder(of: node, offset: offset, duration: duration),
        jumpBelow(jumpHeight: jumpHeight, destination: destination, distance: distance)
        ])
    }
    
    func goLeftandJumpBelow(of node: SKSpriteNode, offset: CGFloat ,duration: TimeInterval, jumpHeight: CGFloat, destination: SKSpriteNode, distance: CGFloat) -> SKAction {
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
    
    var bedToShelfWall : SKAction {
        
        let bedToShelfWall = SKAction.sequence([
            rightBorder(of: bed, offset: 700, duration: 1),
            goLeftandJumpUpward(of: bed, offset: 800, duration: 1, jumpHeight: 50, destination: shelfWall3, distance: 700, slider: 30),
            leftBorder(of: shelfWall3, offset: 0, duration: 0.5),
            goRightandJumpUpward(of: shelfWall3, offset: 300, duration: 1, jumpHeight: 50, destination: shelfWall2, distance: 300, slider: 30),
            rightBorder(of: shelfWall2, offset: 0, duration: 1),
            goLeftandJumpUpward(of: shelfWall2, offset: 0, duration: 1, jumpHeight: 50, destination: shelfWall, distance: 300, slider: 30)
        ])
        
        return bedToShelfWall
    }
    
    var bedToFloor : SKAction {
        let bedToFloor = goRightandJumpBelow(of: bed, offset: 500, duration: 1, jumpHeight: 200, destination: floor, distance: 500)

        return bedToFloor
    }
    
    var floorToBed : SKAction {
        let floorToBed = SKAction.sequence([
            rightBorder(of: floor, offset: 700, duration: 1),
            goLeftandJumpUpward(of: floor, offset: 2700, duration: 1, jumpHeight: 300, destination: bed, distance: 1300, slider: 20)
        ])
        return floorToBed
    }
    var floorToObstacle : SKAction {
        let floorToObstacle = rightBorder(of: clothesObstacle, offset: clothesObstacle.frame.width, duration: 1)
        return floorToObstacle
    }
    
    var obstacleToDoor : SKAction {
        let obstacleToDoor = rightBorder(of: door, offset: door.frame.width/2, duration: 1)
        return obstacleToDoor
    }
    
    
    //MARK: - Specific Movements - Living Room
    
    
    
    //MARK: - Specific Movements - Kitchen
}
