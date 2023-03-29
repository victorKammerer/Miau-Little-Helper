//
//  MovementFunctions.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 28/03/23.
//

import SpriteKit

extension GameScene {
    
    func goToBed() {
        if ninaPosition == "shelfWall" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
            shelfWallToBed,
            SKAction.run {
                self.interationDisabled = false
            }
            ]))
            ninaPosition = "bed"
        }
    }
    func goToFloor() {
        if ninaPosition == "shelfWall" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
            shelfWallToBed,
            bedToFloor,
            SKAction.run {
                self.interationDisabled = false
            }
            ]))
            ninaPosition = "floor"
        } else if ninaPosition == "bed" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
            bedToFloor,
            SKAction.run {
                self.interationDisabled = false
            }
            ]))
            ninaPosition = "floor"
        }
    }
}
