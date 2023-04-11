//
//  Script.swift
//  Miau Little Helper
//
//  Created by rsbj on 10/04/23.
//

import SpriteKit

extension GameScene {
    
    func findNode(_ nodeName: String){
        if textIsShowing {
            textIsShowing = false
        }
        else {
            if isInteractive(node: nodeName) {
                    interaction(nodeName: nodeName)
            }
            else {
                let scriptText = scriptNotInteractive(node: nodeName)
                chatLabel.text = scriptText
                if scriptText != "" {
                    textIsShowing = true
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
                goToSofa()
            } else if nodeName == "kitchenNode" {
                goToKitchen()
            } else if nodeName == "kitchenShelf" {
                goToStove()
            }
        }
    }
    
    func isInteractive(node: String) -> Bool {
        var isInteractive: Bool

        switch node {
            
        case "bed":
            isInteractive = true
        case "floor":
            isInteractive = true
        case "door":
            isInteractive = true
        case "obstacle":
            isInteractive = true
        case "sofa":
            isInteractive = true
        case "shelfWall":
            isInteractive = true
        case "lightswitch":
            isInteractive = true
        case "kitchenNode":
            isInteractive = true
        case "kitchenShelf":
            isInteractive = true
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
        case "shelfWall":
            scriptNotInteractive = "que estante bonita"
        case "obstacle":
            scriptNotInteractive = "ta muito longe"
        case "door":
            scriptNotInteractive = "tem coisa na frente"
        default:
            scriptNotInteractive = ""
        }
        
        return scriptNotInteractive
    }
}
