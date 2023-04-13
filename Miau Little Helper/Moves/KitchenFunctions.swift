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
    
    func turnOffFire() {
        if ninaPosition == "kitchenShelf" && pan.name == "pan" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
            interact,
            SKAction.run {
                self.pan.removeAction(forKey: "panAnimation")
                self.pan.name = "panSolved"
                self.cooker.name = "panSolved"
                self.pan.run(self.panSolved)
                self.interationDisabled = false
                self.textIsShowing = true
                self.chatLabel.text = "E agora? Cadê a Donna? Vou atrás dela!"
            }
            ]))
        } else if (ninaPosition != "kitchenShelf" && currentRoom == 3) && pan.name! == "pan"  {
            let scriptText = scriptNotInteractive(node: "pan")
            chatLabel.text = scriptText
            if scriptText != "" {
                textIsShowing = true
            }
        }
    }
    
}
