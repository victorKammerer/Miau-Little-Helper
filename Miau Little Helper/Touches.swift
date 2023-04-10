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
            var nodeName = touchedNode.name
            
            if textIsShowing {
                textIsShowing = false
            }
            else {
                textIsShowing = true
                if isInteractive(node: nodeName ?? "") {
                    if canInteract() {
                        interaction(nodeName: nodeName ?? "")
                    }
                    else {
                        var scriptText = scriptNotInteractive(node: nodeName ?? "")
                        chatLabel.text = scriptText
                    }
                }
                else {
                    var scriptText = scriptNotInteractive(node: nodeName ?? "")
                    chatLabel.text = scriptText
                }
            }
        }
    }
    
    func interaction(nodeName: String) {
        if interationDisabled == false {
            if nodeName == "bed" {
                goToBed()
            } else if nodeName == "floor" {
                goToFloor()
            } else if nodeName == "shelfWall" {
                goToShelfWall()
            } else if nodeName == "obstacle" {
                goToObstacle()
            } else if nodeName == "door" {
                goToDoorRoom()
            } else if nodeName == "sofa" {
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
