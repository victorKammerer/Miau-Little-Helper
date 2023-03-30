import SpriteKit

extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: UITouch in touches {
            let location = touch.location(in: self)
            if location.x >= cameraNode.frame.midX {
                // Limitei para que não fizesse a transição pra o limbo
                if currentRoom <= 2 {
                    // Vai ajudar na hora de fazer os ifs
                    nextLevelCamera(currentRoom: currentRoom)
                    currentRoom += 1
                    if ninaPosition != "floor" {
                        goToFloor()
                    }
                }
            }
            else {
                if currentRoom >= 2 {
                    previousLevelCamera(currentRoom: currentRoom)
                    currentRoom -= 1
                }
            }
        }
    }
    
}
