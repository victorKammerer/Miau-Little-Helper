//
//  Script.swift
//  Miau Little Helper
//
//  Created by rsbj on 10/04/23.
//

import SpriteKit

extension GameScene {
    
    func isInteractive(node: String) -> Bool {
        var isInteractive: Bool

        switch node {
            
        case "bed":
            isInteractive = false
        case "shelf":
            isInteractive = true
        case "tv":
            isInteractive = false
        default:
            isInteractive = false
        }
        
        return isInteractive
    }
    
    func scriptNotInteractive(node: String) -> String {
        var scriptNotInteractive: String

        switch node {
            
        case "bed":
            scriptNotInteractive = "Que cama bonita"
        case "shelf":
            scriptNotInteractive = "que estante bonita"
        case "tv":
            scriptNotInteractive = "que tv bonita"
        default:
            scriptNotInteractive = ""
        }
        
        return scriptNotInteractive
    }
    
    func canInteract() -> Bool {
        return ((ninaPosition == "floor" && currentRoom == 1) ||
                (ninaPosition == "sofaTop" && currentRoom == 2) ||
                (ninaPosition == "kitchenShelfTop" && currentRoom == 3))
    }
    
}
