//
//  voiceCommands.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 28/03/23.
//

import SpriteKit

extension GameScene {
    
    func voiceCommand() {
        
        if (voiceRecognizer.command == "nina" || voiceRecognizer.command == "menina" || voiceRecognizer.command == "mina" ||
            voiceRecognizer.command == "linda")  {
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

        if voiceCommandAllowed == true && !textIsShowing {
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
            } else if voiceRecognizer.command == "prateleira" || voiceRecognizer.command == "começo" || voiceRecognizer.command == "suba" {
                voiceRecognizer.command = ""
                goToShelfWall()
            }
            else if voiceRecognizer.command == "planta" || voiceRecognizer.command == "vaso" {
                findNode("plant2")
            }
            else if voiceRecognizer.command == "boneco" {
                findNode("toy")
            }
            else if voiceRecognizer.command == "perfume" {
                findNode("perfume")
            }
            else if voiceRecognizer.command == "dito" || voiceRecognizer.command == "ditto" || voiceRecognizer.command == "pokemon" {
                findNode("ditto")
            }
            else if voiceRecognizer.command == "janela" && currentRoom == 1 {
                findNode("window")
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
            else if voiceRecognizer.command == "tv" || voiceRecognizer.command == "televisão" {
                findNode("tv")
            }
            else if voiceRecognizer.command == "cacto" {
                findNode("cactus")
            }
            else if voiceRecognizer.command == "lampada" {
                findNode(lamp.name!)
            }
            else if voiceRecognizer.command == "cadeira" || voiceRecognizer.command == "banco" {
                findNode(chair.name!)
            }
            else if voiceRecognizer.command == "dona" || voiceRecognizer.command == "humana" {
                if !donna.isHidden {
                    findNode(donna.name!)
                }
            }
            else if voiceRecognizer.command == "geladeira" {
                findNode("freezer")
            }
            else if voiceRecognizer.command == "gato" {
                findNode("livingChelf")
            }
            else if voiceRecognizer.command == "armário" {
                findNode("cabinet")
            }
            // MARK: - Comandos da cozinha
            else if voiceRecognizer.command == "desliga" || voiceRecognizer.command == "fogo" || voiceRecognizer.command == "pula" {
                voiceRecognizer.command = ""
                //Precisa da função que se Nina estiver no chão é dito que ela não alcança e precisa subir em algo
                turnOffFire()
            } else if voiceRecognizer.command == "pia" {
                voiceRecognizer.command = ""
                //Precisa da função que se Nina estiver no chão é dito que ela não alcança a pia e precisa achar outro caminho
                findNode("sink")
            } else if voiceRecognizer.command == "prateleira" || voiceRecognizer.command == "estante" || voiceRecognizer.command == "armário" {
                voiceRecognizer.command = ""
                goToStove()
            } else if voiceRecognizer.command == "desliga" || voiceRecognizer.command == "apaga" || voiceRecognizer.command == "fogo" {
                voiceRecognizer.command = ""
                turnOffFire()
                //Precisa da função de Nina cutucar o botão de controle de boca do fogão e descer para o chão automaticamente
            }
            else if voiceRecognizer.command == "janela" && currentRoom == 3 {
                findNode("kitchenWindow")
            }
            else if voiceRecognizer.command == "temperos" || voiceRecognizer.command == "tempero" {
                findNode("spices")
            }
            else if voiceRecognizer.command == "maquina" ||
                        voiceRecognizer.command == "lavar" {
                findNode("washMachine")
            }
            else if voiceRecognizer.command == "rato" {
                findNode("rat")
            }
            else if voiceRecognizer.command == "quarto" || voiceRecognizer.command == "deitar" || voiceRecognizer.command == "voltar" || voiceRecognizer.command == "caminha" || voiceRecognizer.command == "dormir" {
                voiceRecognizer.command = ""
                //Precisa da função da câmera voltar para o quarta e Nina surgir do canto direito da tela
                endGameFunc()
            }
        }
    }
}
