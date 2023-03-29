import SpriteKit

extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: UITouch in touches {
            let location = touch.location(in: self)
            
            if location.x >= cameraNode.frame.midX {
                // Limitei para que não fizesse a transição pra o limbo
                if currentRoom <= 2 {
                    nextLevelCamera(currentRoom: currentRoom)
                    // Vai ajudar na hora de fazer os ifs
                    currentRoom += 1
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
