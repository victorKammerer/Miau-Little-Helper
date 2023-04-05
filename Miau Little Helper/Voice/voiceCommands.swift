//
//  voiceCommands.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 28/03/23.
//

import SpriteKit

extension GameScene {
    
    func voiceCommand() {
        
        if voiceRecognizer.command == "nina" {
            nina.run(SKAction.sequence([
                SKAction.run {
                    self.voiceCommandAllowed = true
                },
                SKAction.wait(forDuration: 5),
                SKAction.run {
                    self.voiceCommandAllowed = false
                }
            ]))
        }
        if voiceCommandAllowed == true {
            if voiceRecognizer.command == "cama" || voiceRecognizer.command == "colchão" || (voiceRecognizer.command == "desça" && ninaPosition == "shelfWall") {
                voiceRecognizer.command = ""
                goToBed()
            } else if voiceRecognizer.command == "chão" || voiceRecognizer.command == "piso" || (voiceRecognizer.command == "desça" && ninaPosition == "bed") {
                voiceRecognizer.command = ""
                goToFloor()
            } else if voiceRecognizer.command == "empurra" || voiceRecognizer.command == "afasta" || voiceRecognizer.command == "puxa" || voiceRecognizer.command == "roupa" {
                voiceRecognizer.command = ""
                goToObstacle()
            } else if voiceRecognizer.command == "porta" || voiceRecognizer.command == "portinha" || voiceRecognizer.command == "andar" || voiceRecognizer.command == "ande" || voiceRecognizer.command == "direita" {
                goToDoorRoom()
            }
            
        }
    }
    
}
