//
//  SKActionsBedroom.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 02/04/23.
//

import SpriteKit

extension GameScene {
    
    var shelfWallToBed : SKAction {
        
        
        let shelfWalltoBed = SKAction.sequence([
            goRightandJumpBelow(of: shelfWall, offset: 0, duration: 1, jumpHeight: 300, destination: shelfWall2, distance: 400),
            SKAction.wait(forDuration: 1.5),
            goLeftandJumpBelow(of: shelfWall2, offset: 0, duration: 1, jumpHeight: 200, destination: shelfWall3, distance: 400),
            SKAction.wait(forDuration: 1.5),
            goRightandJumpBelow(of: shelfWall3, offset: 0, duration: 1, jumpHeight: 200, destination: bed, distance: 300),
            SKAction.wait(forDuration: 1.5)
        ])
        
        return shelfWalltoBed
    }
    
    var bedToShelfWall : SKAction {
        
        let bedToShelfWall = SKAction.sequence([
            rightBorder(of: bed, offset: 700, duration: 1),
            SKAction.wait(forDuration: 0.5),
            goLeftandJumpUpward(of: bed, offset: 800, duration: 1, jumpHeight: 50, destination: shelfWall3, distance: 700, slider: 30),
            SKAction.wait(forDuration: 0.5),
            leftBorder(of: shelfWall3, offset: 0, duration: 0.5),
            SKAction.wait(forDuration: 0.5),
            goRightandJumpUpward(of: shelfWall3, offset: 300, duration: 1, jumpHeight: 50, destination: shelfWall2, distance: 300, slider: 30),
            SKAction.wait(forDuration: 0.5),
            rightBorder(of: shelfWall2, offset: 0, duration: 1),
            SKAction.wait(forDuration: 0.5),
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
            rightBorder(of: floor, offset: 8700, duration: 1),
            goLeftandJumpUpward(of: floor, offset: 2700, duration: 1, jumpHeight: 300, destination: bed, distance: 1300, slider: 20)
        ])
        return floorToBed
    }
    
    var floorToObstacle : SKAction {
        let floorToObstacle = rightBorder(of: clothesObstacle, offset: clothesObstacle.frame.width, duration: 1)
        return floorToObstacle
    }
    
    var obstacleToDoor : SKAction {
        let goToLivingRoom = SKAction.sequence([
            rightBorder(of: door, offset: door.frame.width/2, duration: 1),
            SKAction.run {
                self.nextLevelCamera(currentRoom: self.currentRoom)
                self.currentRoom += 1
            },
            rightBorder(of: floor, offset: 7000, duration: 1)
        ])
        return goToLivingRoom
    }
    
}
