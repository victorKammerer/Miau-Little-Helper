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
                    nina.run(SKAction.sequence([
                    floorToSofa,
                    SKAction.wait(forDuration: 2),
                    sofaToFloor,
                    SKAction.wait(forDuration: 2),
                    floorToKitchen
                    ]))
                }
            }
        }
    }
    
}
