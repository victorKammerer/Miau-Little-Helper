//
//  LivingRoomFunctions.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 02/04/23.
//

import SpriteKit

extension GameScene {
    
    func goToSofa () {
        if ninaPosition == "floor2" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
            floorToSofa,
            SKAction.run {
                self.interationDisabled = false
            }
            ]))
            ninaPosition = "sofa"
        }
    }
    
    func goToKitchen () {
        if ninaPosition == "sofa" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
            sofaToFloor,
            floorToKitchen,
            SKAction.run {
                self.interationDisabled = false
            }
            ]))
            ninaPosition = "floor3"
        } else if ninaPosition == "floor2" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
            floorToKitchen,
            SKAction.run {
                self.interationDisabled = false
            }
            ]))
            ninaPosition = "floor3"
        }
    }
    
    func turnOff () {
        if ninaPosition == "sofa" && lightSwitch.name == "lightswitch" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
            interact,
            SKAction.run {
                self.lightSwitch.texture = SKTexture(imageNamed: "lightswitch2")
                self.lightSwitch.name = "solvedLamp"
                self.interationDisabled = false
            }
            ]))
        } else if lightSwitch.name == "lightswitch" && currentRoom == 2 {
            let scriptText = scriptNotInteractive(node: "lightswitch")
            chatLabel.text = scriptText
            if scriptText != "" {
                textIsShowing = true
            }
        }
    }
}

