//
//  KitchenFunctions.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 02/04/23.
//

import SpriteKit

extension GameScene {
    
    func goToStove() {
        if ninaPosition == "floor3" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
            floorToKitchenShelf,
            SKAction.run {
                self.interationDisabled = false
            }
            ]))
            ninaPosition = "kitchenShelf"
        }
    }
    
}
