//
//  SKActionsKitchen.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 02/04/23.
//

import SpriteKit

extension GameScene {
    
    var floorToKitchenShelf : SKAction {
        
        let floorToKitchenShelf = SKAction.sequence([
            goRightandJumpUpward(of: floor, offset: 1700, duration: 2, jumpHeight: 100, destination: kitchenShelf, distance: 100, slider: 30, offsetLand: 0),
            jumpUpward(of: kitchenShelf, jumpHeight: 100, destination: kitchenShelf2, distance: 100, slider: 20, leftOrRight: "left", offsetLand: 0),
//            jumpUpward(of: kitchenShelf2, jumpHeight: 100, destination: kitchenShelf3, distance: 100, slider: 20, leftOrRight: "left"),
            leftBorder(of: kitchenShelf2, offset: -60, duration: 0.5)
        ])
        return floorToKitchenShelf
    }
    
    var kitchenShelfToFloor : SKAction {
        let kitchenShelfToFloor = SKAction.sequence([
            jumpBelow(jumpHeight: 100, destination: floor, distance: -500, leftOrRight: "right", offsetLand: 0),
        leftBorder(of: floor, offset: 8500, duration: 2)
        ])
        return kitchenShelfToFloor
    }
    
    var kitchenFloorToBedroom : SKAction {
        let kitchenFloorToBedroom = SKAction.sequence([
            SKAction.run {
                self.previousLevelCamera(currentRoom: self.currentRoom)
                self.currentRoom -= 1
            },
            leftBorder(of: floor, offset: 7000, duration: 1.5),
            SKAction.run {
                self.previousLevelCamera(currentRoom: self.currentRoom)
                self.currentRoom -= 1
            },
            SKAction.wait(forDuration: 1),
            leftBorder(of: floor, offset: 4300, duration: 0.1),
            leftBorder(of: floor, offset: 2700, duration: 2),
            goLeftandJumpUpward(of: floor, offset: 2400, duration: 0.5, jumpHeight: 300, destination: bed, distance: 1000, slider: 20, offsetLand: 18),
//            bedToShelfWall,
            SKAction.wait(forDuration: 0.5),
            SKAction.run {
                self.zz.run(self.zzAnimation, withKey: "zzAnimation")
                self.zz.position = CGPoint(x: self.nina.position.x + 150, y: self.nina.position.y + self.nina.frame.height/2)
                self.addChild(self.zz)
            },
            SKAction.repeatForever(sleeping),
        ])
        
        return kitchenFloorToBedroom
    }
}
