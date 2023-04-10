//
//  Touches.swift
//  Miau Little Helper
//
//  Created by rsbj on 30/03/23.
//

import SpriteKit

extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: UITouch in touches {
            let location = touch.location(in: self)
//            if location.x >= cameraNode.frame.midX {
//                // Limitei para que não fizesse a transição pra o limbo
//                if currentRoom <= 2 {
//                    // Vai ajudar na hora de fazer os ifs
//                    nextLevelCamera(currentRoom: currentRoom)
//                    currentRoom += 1
//                }
//            }
//            else {
//                if currentRoom >= 2 {
//                    previousLevelCamera(currentRoom: currentRoom)
//                    currentRoom -= 1
//                }
//            }
//
            let touchedNode = atPoint(location)
            if interationDisabled == false {
                if touchedNode.name == "bed" {
                    goToBed()
                } else if touchedNode.name == "floor" {
                    goToFloor()
                } else if touchedNode.name == "shelfWall" {
                    goToShelfWall()
                } else if touchedNode.name == "obstacle" {
                    goToObstacle()
                } else if touchedNode.name == "door" {
                    goToDoorRoom()
                } else if touchedNode.name == "sofa" {
                    goToSofa()
                } else if touchedNode.name == "kitchenNode" {
                    goToKitchen()
                } else if touchedNode.name == "kitchenShelf" {
                    goToStove()
                }
            }
        }
    }
    
}
