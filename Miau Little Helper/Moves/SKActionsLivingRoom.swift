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
            goRightandJumpUpward(of: floor, offset: 5800, duration: 1.5, jumpHeight: 300, destination: sofa, distance: 420, slider: 30, offsetLand: 45),
            goRightandJumpUpward(of: sofa, offset: 130, duration: 0.1, jumpHeight: 300, destination: sofaTop, distance: 200, slider: 20, offsetLand: 0),
        ])
        
        return floorToSofa
    }
    
    var sofaToFloor : SKAction {
        let sofaToFloor = SKAction.sequence([
            goLeftandJumpBelow(of: sofaTop, offset: 0, duration: 0.1, jumpHeight: 300, destination: sofa, distance: 100, offsetLand: 45),
            goLeftandJumpBelow(of: sofa, offset: 130, duration: 1, jumpHeight: 300, destination: floor, distance: 500, offsetLand: 0),
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
