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
            goRightandJumpUpward(of: floor, offset: 1700, duration: 2, jumpHeight: 100, destination: kitchenShelf, distance: 100, slider: 30),
            jumpUpward(of: kitchenShelf, jumpHeight: 100, destination: kitchenShelf2, distance: 100, slider: 20, leftOrRight: "left"),
//            jumpUpward(of: kitchenShelf2, jumpHeight: 100, destination: kitchenShelf3, distance: 100, slider: 20, leftOrRight: "left"),
            leftBorder(of: kitchenShelf2, offset: 30, duration: 0.5)
        ])
        return floorToKitchenShelf
    }
    
    var kitchenShelfToFloor : SKAction {
        let kitchenShelfToFloor = SKAction.sequence([
        jumpBelow(jumpHeight: 100, destination: floor, distance: -500, leftOrRight: "right"),
        leftBorder(of: floor, offset: 8500, duration: 2)
        ])
        return kitchenShelfToFloor
    }
}
