//
//  Camera.swift
//  Miau Little Helper
//
//  Created by rsbj on 30/03/23.
//

import SpriteKit

class Camera: SKCameraNode {}

extension GameScene {
    func setupCamera() {
        cameraNode.position = CGPoint(x:self.frame.midX, y: self.frame.midY)
        camera = cameraNode
        
        let cameraBounds = self.frame.width/2
        let bounds = self.calculateAccumulatedFrame().width/2 + cameraBounds
        let cameraConstraints = SKConstraint.positionX(.init(lowerLimit: bounds/2, upperLimit: bounds*2.5))
        self.camera?.constraints = [cameraConstraints]
        addChild(cameraNode)
    }
    
    func nextLevelCamera(currentRoom: Int) {
        var nextPosition = CGPoint()
        if currentRoom == 1 {
            nextPosition = CGPoint(x: background2.frame.midX, y: self.frame.midY)
        }
        else if currentRoom == 2 {
            nextPosition = CGPoint(x: background3.frame.midX, y: self.frame.midY)
        }
        cameraNode.run(SKAction.move(to: nextPosition , duration: 1))
    }
    
    func previousLevelCamera(currentRoom: Int) {
        var nextPosition = CGPoint()
        if currentRoom == 3 {
            nextPosition = CGPoint(x: background2.frame.midX, y: self.frame.midY)
        }
        else
        if currentRoom == 2 {
            nextPosition = CGPoint(x: background1.frame.midX, y: self.frame.midY)
        }
        cameraNode.run(SKAction.move(to: nextPosition , duration: 1))
    }
    
}

