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
            if !isNinaAwake {
                wakeUp()
            }
            else if !onboarding {
                onboarding = true
                chatLabel.text = "Ajude o gatinho Nina a descer. Fale ‘Nina, chão!’ ou toque no piso."
            }
            else {
                let location = touch.location(in: self)
                let touchedNode = atPoint(location)
                let nodeName = touchedNode.name
                findNode(nodeName ?? "")
            }
        }
    }
    
}
