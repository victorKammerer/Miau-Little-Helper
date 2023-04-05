//
//  Touches.swift
//  Miau Little Helper
//
//  Created by rsbj on 30/03/23.
//

import SpriteKit

extension GameScene {
    
<<<<<<< HEAD:Miau Little Helper/GameScene+touches.swift
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch: UITouch in touches {
//            let location = touch.location(in: self)
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
//        }
//    }
=======
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: UITouch in touches {
            let location = touch.location(in: self)
            if location.x >= cameraNode.frame.midX {
                // Limitei para que não fizesse a transição pra o limbo
                if currentRoom <= 2 {
                    // Vai ajudar na hora de fazer os ifs
                    nextLevelCamera(currentRoom: currentRoom)
                    currentRoom += 1
                }
            }
            else {
                if currentRoom >= 2 {
                    previousLevelCamera(currentRoom: currentRoom)
                    currentRoom -= 1
                }
            }
            
            let touchedNode = atPoint(location)
            if touchedNode.name == "bed" {
                goToBed()
            } else if touchedNode.name == "floor" {
                goToFloor()
            } else if touchedNode.name == "shelfWall" {
                goToShelfWall()
            } else if touchedNode.name == "obstacle" {
                goToObstacle()
            }
        }
    }
>>>>>>> refs/remotes/origin/develop:Miau Little Helper/Touches.swift
    
}
