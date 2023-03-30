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
        if currentRoom == 1 {
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
        else {
            if ninaPosition == "shelfWall" {
                self.interationDisabled = true
                nina.run(SKAction.sequence([
                    shelfWallToBed,
                    bedToFloor,
                    SKAction.run {
                        self.interationDisabled = false
                    }, SKAction.run {
                        self.nina.xScale = 1.0
                        self.nina.run(self.walk, withKey: "ninaMoveAnimation")
                    },
                    SKAction.moveTo(x: background2.position.x, duration: 1),
                    SKAction.run {
                        self.nina.removeAction(forKey: "ninaMoveAnimation")
                        //jump animation?
                    }
                ]))
                ninaPosition = "floor"
            } else if ninaPosition == "bed" {
                self.interationDisabled = true
                nina.run(SKAction.sequence([
                    bedToFloor,
                    SKAction.run {
                        self.interationDisabled = false
                    }, SKAction.run {
                        self.nina.xScale = 1.0
                        self.nina.run(self.walk, withKey: "ninaMoveAnimation")
                    },
                    SKAction.moveTo(x: background2.position.x, duration: 1),
                    SKAction.run {
                        self.nina.removeAction(forKey: "ninaMoveAnimation")
                        //jump animation?
                    }
                ]))
                ninaPosition = "floor"
            }
        }
    }
}
