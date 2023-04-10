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
            
        case "sofa":
            isInteractive = true
        case "shelf":
            isInteractive = true
        case "tv":
            isInteractive = true
        default:
            isInteractive = true
        }
        
        return isInteractive
    }
    
    func scriptNotInteractive(node: String) -> String {
        var scriptNotInteractive: String

        switch node {
            
        case "sofa":
            scriptNotInteractive = "que sofá bonito"
        case "shelf":
            scriptNotInteractive = "que estante bonita"
        case "tv":
            scriptNotInteractive = "que tv bonita"
        default:
            scriptNotInteractive = "..."
        }
        
        return scriptNotInteractive
    }
    
    func canInteract() -> Bool {
        return ((ninaPosition == "floor" && currentRoom == 1) ||
                (ninaPosition == "sofa" && currentRoom == 2) ||
                (ninaPosition == "shelf" && currentRoom == 2))
    }
    
}
