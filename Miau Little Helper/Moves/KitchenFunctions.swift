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
            self.isListening.fontColor = .clear
            nina.run(SKAction.sequence([
            floorToKitchenShelf,
            SKAction.run {
                self.interationDisabled = false
            }
            ]))
            ninaPosition = "kitchenShelf"
        }
    }
    
    func turnOffFire() {
        if ninaPosition == "kitchenShelf" && pan.name == "cooker" {
            self.interationDisabled = true
            self.isListening.fontColor = .clear
            nina.run(SKAction.sequence([
            interact,
            SKAction.run {
                self.pan.removeAction(forKey: "panAnimation")
                self.pan.name = "panSolved"
                self.cooker.name = "panSolved"
                self.pan.run(self.panSolved)
                self.interationDisabled = false
                self.textIsShowing = true
                self.chatLabel.text = "Aii que soninho, vou voltar para o quarto e dormir"
            }
            ]))
        } else if (ninaPosition != "kitchenShelf" && currentRoom == 3) && pan.name! == "cooker"  {
            let scriptText = scriptNotInteractive(node: "cooker")
            chatLabel.text = scriptText
            if scriptText != "" {
                textIsShowing = true
            }
        }
    }
    
    func endGameFunc() {
        if ninaPosition == "kitchenShelf" && pan.name == "panSolved" {
            self.interationDisabled = true
            self.isListening.fontColor = .clear
            nina.run(SKAction.sequence([
                kitchenShelfToFloor,
                kitchenFloorToBedroom,
            ]))
        } else if ninaPosition == "floor3" && pan.name == "panSolved" {
            self.interationDisabled = true
            self.isListening.fontColor = .clear
            nina.run(SKAction.sequence([
                kitchenFloorToBedroom,
                SKAction.run {
                    self.showCredit = true
                    self.nina.removeAllActions()
                }
            ]))
        }
    }
}
