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
    var backgroundQuarto = SKSpriteNode()
    var backgroundSala = SKSpriteNode()
    var backgroundCozinha = SKSpriteNode()
    
    private lazy var cameraNode: Camera = {
            let cameraNode = Camera()
        cameraNode.position = CGPoint(x:self.frame.midX, y: self.frame.midY)
            return cameraNode
        }()
    
    override func didMove(to view: SKView) {
        print("colocou cena")
        voiceRecognizer.requestPermission()
        setup()
        
        camera = cameraNode
        
        let cameraBounds = self.frame.width/2
        let bounds = self.calculateAccumulatedFrame().width/2 - cameraBounds
        let cameraConstraints = SKConstraint.positionX(.init(lowerLimit: bounds/2, upperLimit: bounds*2.5))
        self.camera?.constraints = [cameraConstraints]
        // Para mexer a posição da camera eh só fazer cameraBounds.position =
        addChild(cameraNode)
    }
    
    func setup() {
        backgroundQuarto = SKSpriteNode(color: .red, size: CGSize(width: self.frame.height * 4 / 3, height: self.frame.height))
        backgroundSala = SKSpriteNode(color: .blue, size: CGSize(width: self.frame.height * 4 / 3, height: self.frame.height))
        backgroundCozinha = SKSpriteNode(color: .green, size: CGSize(width: self.frame.height * 4 / 3, height: self.frame.height))
        
        backgroundQuarto.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundSala.position = CGPoint(x: backgroundQuarto.frame.maxX + backgroundSala.size.width/2, y: self.frame.midY)
        backgroundCozinha.position = CGPoint(x: backgroundSala.frame.maxX + backgroundCozinha.size.width/2, y: self.frame.midY)
        
        addChild(backgroundQuarto)
        addChild(backgroundSala)
        addChild(backgroundCozinha)
    }
    
    override func update(_ currentTime: TimeInterval) {
//        exemplo de aplicação:
//        if voiceRecognizer.command == "comando esperado" {
//            insere aqui a ação
//        }
    }
}

class Camera: SKCameraNode {

}
