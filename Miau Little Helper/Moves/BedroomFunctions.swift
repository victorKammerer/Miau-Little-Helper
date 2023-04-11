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
        } else if currentRoom == 1 {
            let scriptText = scriptNotInteractive(node: "bed")
            chatLabel.text = scriptText
            if scriptText != "" {
                textIsShowing = true
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
        } else if currentRoom == 1 {
            let scriptText = scriptNotInteractive(node: "shelfWall")
            chatLabel.text = scriptText
            if scriptText != "" {
                textIsShowing = true
            }
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
        else if currentRoom == 1 {
            let scriptText = scriptNotInteractive(node: "obstacle")
            chatLabel.text = scriptText
            if scriptText != "" {
                textIsShowing = true
            }
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
                ninaPosition = "floor2"
            } else if ninaPosition == "bed" {
                nina.run(SKAction.sequence([
                    bedToFloor,
                    obstacleToDoor,
                    SKAction.run {
                        self.interationDisabled = false
                    }

                ]))
                ninaPosition = "floor2"
            } else if ninaPosition == "floor" {
                nina.run(SKAction.sequence([
                    obstacleToDoor,
                    SKAction.run {
                        self.interationDisabled = false
                    }
                ]))
                ninaPosition = "floor2"
            }
        }
        else if currentRoom == 1 {
            let scriptText = scriptNotInteractive(node: "door")
            chatLabel.text = scriptText
            if scriptText != "" {
                textIsShowing = true
            }
        }
    }
}
