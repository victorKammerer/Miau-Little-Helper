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
        } else if ninaPosition == "floor" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
            floorToBed,
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
                    }
                ]))
                ninaPosition = "floor"
            }
        }
    }
    
    func goToShelfWall() {
        if ninaPosition == "floor" {
            nina.run(SKAction.sequence([
                floorToBed,
                bedToShelfWall,
                SKAction.run {
                    self.interationDisabled = false
                }
            ]))
            ninaPosition = "shelfWall"
        } else if ninaPosition == "bed" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
                bedToShelfWall,
                SKAction.run {
                    self.interationDisabled = false
                }
            ]))
            ninaPosition = "shelfWall"
        }
    }
    
    func goToObstacle() {
        if ninaPosition == "floor" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
                floorToObstacle,
                SKAction.run {
                    self.interationDisabled = false
                    self.clothesObstacle.removeFromParent()
                    self.clothesObstacle.name = "solved"
                }
            ]))
            ninaPosition =  "floor"
        }
    }
    
    func goToDoorRoom() {
        if clothesObstacle.name == "solved" {
            self.interationDisabled = true
            if ninaPosition == "shelfWall" {
                nina.run(SKAction.sequence([
                    shelfWallToBed,
                    bedToFloor,
                    floorToObstacle,
                    obstacleToDoor,
                    SKAction.run {
                        self.interationDisabled = false
                    }

                ]))
                //ninaPosition = ?
            } else if ninaPosition == "bed" {
                nina.run(SKAction.sequence([
                    bedToFloor,
                    obstacleToDoor,
                    SKAction.run {
                        self.interationDisabled = false
                    }

                ]))
                //ninaPosition = ?
            } else if ninaPosition == "floor" {
                nina.run(SKAction.sequence([
                    obstacleToDoor,
                    SKAction.run {
                        self.interationDisabled = false
                    }
                ]))
            }
        }
    }
}
