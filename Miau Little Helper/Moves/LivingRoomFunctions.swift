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
                    self.textIsShowing = true
                    self.chatLabel.text = "Ah, não! Donna esqueceu uma panela no fogão! Preciso desligar o fogo!"
                }
            ]))
            ninaPosition = "floor3"
        } else if ninaPosition == "floor2" {
            self.interationDisabled = true
            nina.run(SKAction.sequence([
                floorToKitchen,
                SKAction.run {
                    self.interationDisabled = false
                    self.textIsShowing = true
                    self.chatLabel.text = "Ah, não! Donna esqueceu uma panela no fogão! Preciso desligar o fogo!"
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

                self.lamp.name = "solvedLamp"
                self.lampCover.name = "solvedLamp"
                self.chair.name = "solvedLamp"
                self.lampCover.isHidden = true
                self.lightSwitch.texture!.filteringMode = SKTextureFilteringMode.nearest
                self.donna.run(SKAction.sequence([
                    self.jumpBelowDonna(jumpHeight: 100, destination: self.floor, distance: -450, offset: 100),
                    self.leftBorderDonna(of: self.floor, offset: 4300, duration: 0.5),
                    SKAction.run {
                        self.donna.xScale = 1
                        self.donnaAttention.position = CGPoint(x: self.donna.position.x, y: self.donna.position.y + self.donna.frame.height/2 + self.donnaAttention.frame.height/2)
                        self.donnaAttention.fontColor = .red
                    },
                    SKAction.animate(with: [SKTexture(imageNamed: "iddleFront")], timePerFrame: 0.1),
                    SKAction.run {
                        self.textIsShowing = true
                        self.chatLabel.text = "Eu esqueci de comprar Pão!"
                    },
                    SKAction.wait(forDuration: 4),
                    SKAction.run {
                        self.textIsShowing = false
                        self.donnaAttention.removeFromParent()
                        self.donna.run(self.rightBorderDonna(of: self.floor, offset: 6600, duration: 0.5))
                        self.donna.run(SKAction.move(by: CGVector(dx: 0, dy: 50), duration: 0.5))
                    },
                    SKAction.wait(forDuration: 0.5),
                    SKAction.run {
                        self.donna.isHidden = true
                        self.nina.xScale = -1
                        self.isListening.fontColor = .red
                        self.isListening.position = CGPoint(x: self.nina.position.x, y: self.nina.position.y + self.nina.frame.height/2)
                    },
                    SKAction.wait(forDuration: 2),
                    SKAction.run {
                        self.didSolveLevel2 = true
                        self.interationDisabled = false
                        self.textIsShowing = true
                        self.isListening.fontColor = .clear
                        self.chatLabel.text = "Que cheiro é esse? Parece que vem da cozinha!"
                    }
                ]))
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

