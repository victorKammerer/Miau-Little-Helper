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
            let nodeName = touchedNode.name
            findNode(nodeName ?? "")
        }
    }
    
}
