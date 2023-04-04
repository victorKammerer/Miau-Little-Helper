//
//  SKActionsLivingRoom.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 02/04/23.
//

import SpriteKit

extension GameScene {
    
    var floorToSofa : SKAction {
        let floorToSofa = SKAction.sequence([
            goRightandJumpUpward(of: floor, offset: 6000, duration: 1, jumpHeight: 300, destination: sofa, distance: 400, slider: 30),
            goRightandJumpUpward(of: sofa, offset: 100, duration: 1, jumpHeight: 300, destination: sofaTop, distance: 200, slider: 20),
        ])
        
        return floorToSofa
    }
    
    var sofaToFloor : SKAction {
        let sofaToFloor = SKAction.sequence([
            goLeftandJumpBelow(of: sofaTop, offset: 0, duration: 1, jumpHeight: 300, destination: sofa, distance: 100),
            goLeftandJumpBelow(of: sofa, offset: 0, duration: 1, jumpHeight: 300, destination: floor, distance: 500),
        ])
        
        return sofaToFloor
    }
    
    var floorToKitchen : SKAction {
        let floorToKitchen = SKAction.sequence([
            rightBorder(of: floor, offset: 4100, duration: 2),
            SKAction.run {
                self.nextLevelCamera(currentRoom: self.currentRoom)
                self.currentRoom += 1
            },
            rightBorder(of: floor, offset: 3500, duration: 1)
        ])
        return floorToKitchen
    }
}
