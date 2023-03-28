//
//  GameScene.swift
//  Miau Little Helper
//
//  Created by rsbj on 20/03/23.
//

import SpriteKit
import Speech

class GameScene: SKScene, SFSpeechRecognizerDelegate {
    
    var voiceRecognizer = VoiceRecognizer()
    
    override func didMove(to view: SKView) {
        print("colocou cena")
        voiceRecognizer.requestPermission()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
//        exemplo de aplicação:
//        if voiceRecognizer.command == "comando esperado" {
//            insere aqui a ação
//        }
    }
}
