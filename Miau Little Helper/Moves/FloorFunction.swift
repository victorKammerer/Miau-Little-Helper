//
//  FloorFunction.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 10/04/23.
//

import SpriteKit

extension GameScene {
    
    func goToFloor() {
            if ninaPosition == "shelfWall" {
                self.interationDisabled = true
                self.isListening.fontColor = .clear
                nina.run(SKAction.sequence([
                    shelfWallToBed,
                    bedToFloor,
                    SKAction.run {
                        self.interationDisabled = false
                    },
                    SKAction.run {
                        self.textIsShowing = true
                        self.chatLabel.text = "Onde será que a Donna está?"
                    }
                ]))
                ninaPosition = "floor"
                textIsShowing = false
            } else if ninaPosition == "bed" {
                self.interationDisabled = true
                self.isListening.fontColor = .clear
                nina.run(SKAction.sequence([
                    bedToFloor,
                    SKAction.run {
                        self.interationDisabled = false
                    }
                ]))
                ninaPosition = "floor"
            } else if ninaPosition == "sofa" {
                self.interationDisabled = true
                self.isListening.fontColor = .clear
                nina.run(SKAction.sequence([
                sofaToFloor,
                SKAction.run {
                    self.interationDisabled = false
                }
                ]))
                ninaPosition = "floor2"
            } else if ninaPosition == "kitchenShelf" {
                self.interationDisabled = true
                self.isListening.fontColor = .clear
                nina.run(SKAction.sequence([
                kitchenShelfToFloor,
                SKAction.run {
                    self.interationDisabled = false
                }
                ]))
                ninaPosition = "floor3"
            }
    }
    
}
