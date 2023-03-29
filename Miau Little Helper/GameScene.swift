//
//  GameScene.swift
//  Miau Little Helper
//
//  Created by rsbj on 20/03/23.
//

import SpriteKit
import Speech

class GameScene: SKScene {
    
    var voiceRecognizer = VoiceRecognizer()
    var backgroundQuarto = SKSpriteNode()
    var backgroundSala = SKSpriteNode()
    var backgroundCozinha = SKSpriteNode()
    var nina = SKSpriteNode()

    var ninaPosition = "shelfWall"
    var textureAnimation = SKAction()
    var walk = SKAction()
    var interationDisabled = false
    var voiceCommandAllowed = false
    
    var currentRoom = 1
    var cameraNode = Camera()

    
    override func didMove(to view: SKView) {
        voiceRecognizer.requestPermission()
        
        setupCamera()
        setupBackground()
        setupNina()
        setupRoom()
    }
    
    override func update(_ currentTime: TimeInterval) {
        voiceCommand()
    }
    
    func setupBackground() {
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
    
    func setupNina() {
        
        textureAnimation = SKAction.animate(with: ninaMovementTexture, timePerFrame: 0.1)
        walk = SKAction.repeatForever(textureAnimation)
        
        nina = SKSpriteNode(imageNamed: "nina1")
        nina.size = CGSize(width: 400, height: 300)
        nina.position = CGPoint(x: 400, y: shelfWall.position.y + shelfWall.frame.height/2 + nina.frame.height/2)
        
//        nina.run(walk)
        
        addChild(nina)
        nina.zPosition = 100
        
        
    }
    
}
