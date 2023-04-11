//
//  voiceCommands.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 28/03/23.
//

import SpriteKit

extension GameScene {
    
    func voiceCommand() {
        
        if voiceRecognizer.command == "nina" {
            nina.run(SKAction.sequence([
                SKAction.run {
                    self.voiceCommandAllowed = true
                },
                SKAction.wait(forDuration: 5),
                SKAction.run {
                    self.voiceCommandAllowed = false
                }
            ]))
        }
        if voiceCommandAllowed == true {
            if voiceRecognizer.command == "cama" || voiceRecognizer.command == "colchão" || (voiceRecognizer.command == "desça" && ninaPosition == "shelfWall") {
                voiceRecognizer.command = ""
                goToBed()
            } else if voiceRecognizer.command == "chão" || voiceRecognizer.command == "piso" || (voiceRecognizer.command == "desça" && ninaPosition == "bed") {
                voiceRecognizer.command = ""
                goToFloor()
            } else if voiceRecognizer.command == "empurra" || voiceRecognizer.command == "afasta" || voiceRecognizer.command == "puxa" || voiceRecognizer.command == "roupa" {
                voiceRecognizer.command = ""
                goToObstacle()
            } else if voiceRecognizer.command == "porta" || voiceRecognizer.command == "portinha" || voiceRecognizer.command == "andar" || voiceRecognizer.command == "ande" || voiceRecognizer.command == "direita" {
                voiceRecognizer.command = ""
                goToDoorRoom()
            } else if voiceRecognizer.command == "prateleira" || voiceRecognizer.command == "começo" {
                voiceRecognizer.command = ""
                goToShelfWall()
            }
            // MARK: - Comandos da sala
            else if voiceRecognizer.command == "poltrona" || voiceRecognizer.command == "sofá" || (voiceRecognizer.command == "sobe" && ninaPosition == "chão")
            //Precisa definir qual a posição do chão da sala (chão1, chão2, etc) para Nina não correr pra o quarto antes de subir no sofá
            {
                voiceRecognizer.command = ""
                //Precisa daa função que sobe no sofá da sala
            } else if voiceRecognizer.command == "desligar" || voiceRecognizer.command == "interruptor" || voiceRecognizer.command == "luz" {
                voiceRecognizer.command = ""
                //Precisa da função que desliga o interruptor
            } else if voiceRecognizer.command == "desce" || voiceRecognizer.command == "chão" || voiceRecognizer.command == "cozinha" {
                voiceRecognizer.command = ""
                //Precisa da função que vai para a cozinha
            }
            // MARK: - Comandos da cozinha
            else if voiceRecognizer.command == "desliga" || voiceRecognizer.command == "fogo" || voiceRecognizer.command == "pula" {
                voiceRecognizer.command = ""
                //Precisa da função que se Nina estiver no chão é dito que ela não alcança e precisa subir em algo
            } else if voiceRecognizer.command == "pia" {
                voiceRecognizer.command = ""
                //Precisa da função que se Nina estiver no chão é dito que ela não alcança a pia e precisa achar outro caminho
            } else if voiceRecognizer.command == "prateleira" || voiceRecognizer.command == "estante" || voiceRecognizer.command == "armário" {
                voiceRecognizer.command = ""
                //Precisa da função de Nina subir na prateleira do armário
            } else if voiceRecognizer.command == "desliga" || voiceRecognizer.command == "apaga" || voiceRecognizer.command == "fogo" {
                voiceRecognizer.command = ""
                //Precisa da função de Nina cutucar o botão de controle de boca do fogão e descer para o chão automaticamente
            }
            //MARK: - Comando de volta para o quarto
            else if voiceRecognizer.command == "quarto" || voiceRecognizer.command == "deitar" || voiceRecognizer.command == "voltar" || voiceRecognizer.command == "caminha" || voiceRecognizer.command == "dormir" {
                voiceRecognizer.command = ""
                //Precisa da função da câmera voltar para o quarta e Nina surgir do canto direito da tela
            }
        }
    }
    
}
