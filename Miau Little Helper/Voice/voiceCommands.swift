//
//  voiceCommands.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 28/03/23.
//

import SpriteKit

extension GameScene {
    
    func voiceCommand() {
        
        if (voiceRecognizer.command == "nina" || voiceRecognizer.command == "menina" || voiceRecognizer.command == "mina") {
            voiceRecognizer.command = ""
            nina.removeAction(forKey: "voiceTriggered")
            nina.run(SKAction.sequence([
                SKAction.run {
                    self.voiceCommandAllowed = true
                    self.isListening.zPosition = 1000
                    self.isListening.position = CGPoint(x: self.nina.position.x, y: self.nina.position.y + self.nina.frame.height/2)
                    self.isListening.fontColor = .red
                },
                SKAction.wait(forDuration: 5),
                SKAction.run {
                    if self.voiceCommandAllowed {
                        self.voiceCommandAllowed = false
                        self.isListening.fontColor = .clear
                    }
                }
            ]), withKey: "voiceTriggered")
        }

        else if (voiceRecognizer.command == "ok" || voiceRecognizer.command == "beleza" || voiceRecognizer.command == "passar" ||
            voiceRecognizer.command == "fechar" ||
            voiceRecognizer.command == "sair") && isNinaAwake {
            voiceRecognizer.command = ""
            if !onboarding {
                onboarding = true
                chatLabel.text = "Ajude o gatinho Nina a descer. Fale ‘Nina, chão!’ ou toque no piso."
            }
            else {
                textIsShowing = false
                print(onboarding)
                      }
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
            else if voiceRecognizer.command == "poltrona" || voiceRecognizer.command == "sofá" || (voiceRecognizer.command == "sobe" && ninaPosition == "floor2")
            {
                voiceRecognizer.command = ""
                goToSofa()
            } else if (voiceRecognizer.command == "desligar" || voiceRecognizer.command == "interruptor" || voiceRecognizer.command == "luz") && currentRoom == 2 {
                voiceRecognizer.command = ""
                turnOff()
            } else if voiceRecognizer.command == "desce" || voiceRecognizer.command == "chão" || voiceRecognizer.command == "cozinha" {
                voiceRecognizer.command = ""
                goToFloor()
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
                goToStove()
            } else if voiceRecognizer.command == "desliga" || voiceRecognizer.command == "apaga" || voiceRecognizer.command == "fogo" {
                voiceRecognizer.command = ""
                turnOffFire()
                //Precisa da função de Nina cutucar o botão de controle de boca do fogão e descer para o chão automaticamente
            }
        }
        if voiceCommandAllowed == true {
            if !isNinaAwake{
                if voiceRecognizer.command == "acorda" || voiceRecognizer.command == "levanta" || voiceRecognizer.command == "levante" ||
                    voiceRecognizer.command == "acorde"{
                    voiceRecognizer.command = ""
                    wakeUp()
                }
            } else {
                if voiceRecognizer.command == "cama" || voiceRecognizer.command == "colchão" || (voiceRecognizer.command == "desça" && ninaPosition == "shelfWall") {
                    voiceRecognizer.command = ""
                    self.isListening.fontColor = .clear
                    goToBed()
                } else if voiceRecognizer.command == "chão" || voiceRecognizer.command == "piso" || (voiceRecognizer.command == "desça" && ninaPosition == "bed") {
                    voiceRecognizer.command = ""
                    self.isListening.fontColor = .clear
                    goToFloor()
                } else if voiceRecognizer.command == "empurra" || voiceRecognizer.command == "afasta" || voiceRecognizer.command == "puxa" || voiceRecognizer.command == "roupa" {
                    voiceRecognizer.command = ""
                    self.isListening.fontColor = .clear
                    goToObstacle()
                } else if voiceRecognizer.command == "porta" || voiceRecognizer.command == "portinha" || voiceRecognizer.command == "andar" || voiceRecognizer.command == "ande" || voiceRecognizer.command == "direita" {
                    voiceRecognizer.command = ""
                    self.isListening.fontColor = .clear
                    goToDoorRoom()
                } else if voiceRecognizer.command == "prateleira" || voiceRecognizer.command == "começo" {
                    voiceRecognizer.command = ""
                    self.isListening.fontColor = .clear
                    goToShelfWall()
                }
                // MARK: - Comandos da sala
                else if voiceRecognizer.command == "poltrona" || voiceRecognizer.command == "sofá" || (voiceRecognizer.command == "sobe" && ninaPosition == "floor2")
                {
                    voiceRecognizer.command = ""
                    self.isListening.fontColor = .clear
                    goToSofa()
                } else if voiceRecognizer.command == "desligar" || voiceRecognizer.command == "interruptor" || voiceRecognizer.command == "luz" {
                    voiceRecognizer.command = ""
                    //Precisa da função que desliga o interruptor
                } else if voiceRecognizer.command == "desce" || voiceRecognizer.command == "chão" || voiceRecognizer.command == "cozinha" {
                    voiceRecognizer.command = ""
                    self.isListening.fontColor = .clear
                    goToFloor()
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
                    self.isListening.fontColor = .clear
                    goToStove()
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
}
