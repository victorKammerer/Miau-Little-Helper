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
        if interationDisabled == false && isNinaAwake {
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
            } else if nodeName == "cooker" {
                turnOffFire()
            } else if nodeName == "lightswitch" {
                turnOff()
            }
        }
    }
    
    func isInteractive(node: String) -> Bool {
        var isInteractive: Bool

        switch node {
            
//      Bedroom
        case "bed":
            isInteractive = true
        case "floor":
            isInteractive = true
        case "door":
            isInteractive = true
        case "obstacle":
            isInteractive = true
        case "shelfWall":
            isInteractive = true
        case "window":
            isInteractive = false
        case "toy":
            isInteractive = false
        case "play":
            isInteractive = false
        case "plant":
            isInteractive = false
        case "plant2":
            isInteractive = false
        case "perfume":
            isInteractive = false
        case "ditto":
            isInteractive = false
        case "clothes":
            isInteractive = false
        case "pile":
            isInteractive = false
//      Livingroom
        case "solvedLamp":
            isInteractive = false
        case "sofa":
            isInteractive = true
        case "sofaTop":
            isInteractive = true
        case "donna":
            isInteractive = false
        case "doorLivingRoom":
            isInteractive = false
        case "tv":
            isInteractive = false
        case "freezer":
            isInteractive = false
        case "lamp":
            isInteractive = false
        case "chair":
            isInteractive = false
        case "lightswitch":
            isInteractive = true
        case "cactus":
            isInteractive = false
        case "livingChelf":
            isInteractive = false
//      Kitchen
        case "kitchenNode":
            isInteractive = true
        case "kitchenShelf":
            isInteractive = true
        case "panSolved":
            isInteractive = false
        case "cooker":
            isInteractive = true
        case "washMashine":
            isInteractive = false
        case "sink":
            isInteractive = false
        case "kitchenWindow":
            isInteractive = false
        case "rat":
            isInteractive = false
        case "spices":
            isInteractive = false
        case "cabinet":
            isInteractive = false
        default:
            isInteractive = false
        }
        
        return isInteractive
    }
    
    func scriptNotInteractive(node: String) -> String {
        var scriptNotInteractive: String

        switch node {
//      Bedroom
        case "obstacle":
            scriptNotInteractive = "Olha quanta bagunça, seu eu tivesse patas como a dela limparia essa jossa."
        case "door":
            scriptNotInteractive = "Oxe, tem uma caixa na frente da minha portinha! Como eu faço pra tirar esses troços daí?"
//      ainda n tem node
        case "pile":
            scriptNotInteractive = "A Donna não tem jeito mesmo. Esse quarto tá pôdi!"
        case "toy":
            scriptNotInteractive = "A Donna tirou minha caminha lá de cima pra botar esses bonecos de herói… Qualquer dia eles somem, hehehe!"
        case "plant":
            scriptNotInteractive = "Essas plantinhas tem uma terra cheirosa! É bem melhor que a da minha caixa de areia…"
        case "plant2":
            scriptNotInteractive = "Quando eu tenho dor de barriga vou direto mastigar uma folhinha dessas. É tiro e queda!"
        case "window":
            scriptNotInteractive = "O dia está sempre lindo enquanto eu estiver dentro de casa."
        case "perfume":
            scriptNotInteractive = "Argh, devia quebrar esse negócio! Cheiro horroroso!"
        case "ditto":
            scriptNotInteractive = "Já vi a Donna louca por esses negócio. É sobre humano que bota bicho pra lutar… Bizarro…"
        case "clothes":
            scriptNotInteractive = "Pelo menos tem que ter alguma coisa arrumada nesse quarto, né?"
//      Livingroom
        case "solvedLamp":
            scriptNotInteractive = "Ufa! Essa foi por pouco."
        case "donna":
            scriptNotInteractive = "Ela é muito distraída! Nem me notou aqui!"
        case "lightswitch":
            scriptNotInteractive = "Não consigo alcançar ele daqui! Tenho que usar o sofá."
        case "doorLivingRoom":
            scriptNotInteractive = "Queria que aí tivesse uma portinha também só pra eu dar uma brechadinha lá fora."
        case "tv":
            scriptNotInteractive = "De vez em quando tem uns troços legais nesse vidro, mas nunca consigo pegar nada!"
        case "freezer":
            scriptNotInteractive = "Daí sai uma comida maravilhosa! Ela é molhada e cheirosa… Ai que fome!"
        case "lamp":
            scriptNotInteractive = "A Dona tá mexendo na lâmpada com tudo ligado!"
        case "chair":
            scriptNotInteractive = "Caramba, Donna… É cada invenção pra dar errado eu nunca pensaria!"
//      ainda n tem node
        case "cactus":
            scriptNotInteractive = "Essa daí fura! Não gosto dela."
        case "livingChelf":
            scriptNotInteractive = "MMmMIiIIiAaAAaUuUUuUu!!!!"
//      Kitchen
        case "washMachine":
            scriptNotInteractive = "Adoro ver esse troço rodando."
        case "cooker":
            scriptNotInteractive = "Daqui eu não alcanço. Preciso subir em algo"
        case "sink":
            scriptNotInteractive = "Não consigo subir ali! Tenho que achar outro caminho."
        case "kitchenWindow":
            scriptNotInteractive = "O dia está sempre lindo enquanto eu estiver dentro de casa."
        case "panSolved":
            scriptNotInteractive = "Quase que a Donna botava fogo na casa."
//      ainda n tem node
        case "rat":
            scriptNotInteractive = "Essa foi minha caça de ontem. Já brinquei demais com isso."
        case "spices":
            scriptNotInteractive = "Muitos cheiros aí! Alguns são bons…"
        case "cabinet":
            scriptNotInteractive = "Aah, um dia eu vou subir lá!"
        default:
            scriptNotInteractive = ""
        }
        
        return scriptNotInteractive
    }
}
