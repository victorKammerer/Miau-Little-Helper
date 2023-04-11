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
    var backgroundCompleto = SKSpriteNode()
    var background1 = SKSpriteNode()
    var background2 = SKSpriteNode()
    var background3 = SKSpriteNode()
    var nina = SKSpriteNode()
    var donna = SKSpriteNode()

    var ninaPosition = "shelfWall"
    var interationDisabled = false
    var voiceCommandAllowed = false
    
    var currentRoom = 1
    var cameraNode = Camera()
    var clothesObstacle = SKSpriteNode(color: .cyan, size: CGSize(width: 400, height: 400))
    
    var backgroundMusic = SKAudioNode(fileNamed: "backgroundMusic.wav")
    var stepsSound1 = SKAudioNode(fileNamed: "steps.wav")
    var stepsSound2 = SKAudioNode(fileNamed:"steps.wav")
    var jumpSound = SKAudioNode(fileNamed: "jump.wav")
    var landedSound = SKAudioNode(fileNamed: "landed.wav")

    
    override func didMove(to view: SKView) {
        voiceRecognizer.requestPermission()
        
        setupCamera()
        setupBackground()
        setupNina()
        setupDonna()
        setupRoom()
        setupLivingRoom()
        setupKitchen()
        setupSounds()
    }
    
    override func update(_ currentTime: TimeInterval) {
        voiceCommand()
//        if currentRoom == 3 {
//            cameraNode.position.x = nina.position.x
//        }
    }
    
    func setupBackground() {
        background1 = SKSpriteNode(color: .red, size: CGSize(width: self.frame.height * 4 / 3, height: self.frame.height))
        background2 = SKSpriteNode(color: .blue, size: CGSize(width: self.frame.height * 4 / 3, height: self.frame.height))
        background3 = SKSpriteNode(color: .green, size: CGSize(width: self.frame.height * 4 / 3, height: self.frame.height))
        
        background1.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        background2.position = CGPoint(x: background1.frame.maxX + background2.size.width/2, y: self.frame.midY)
        background3.position = CGPoint(x: background2.frame.maxX + background3.size.width/2, y: self.frame.midY)
        
        addChild(background1)
        addChild(background2)
        addChild(background3)
        
        backgroundCompleto = SKSpriteNode(imageNamed: "background")
        backgroundCompleto.texture!.filteringMode = SKTextureFilteringMode.nearest
        backgroundCompleto.size = CGSize(width: self.frame.height * 4, height: self.frame.height)
        backgroundCompleto.position = background2.position
        addChild(backgroundCompleto)
    }
    
    func setupNina() {
        nina = SKSpriteNode(imageNamed: "nina1")
        nina.size = CGSize(width: 400, height: 300)
        nina.position = CGPoint(x: 500, y: shelfWall3.position.y + shelfWall3.frame.height/2 + nina.frame.height/2)
        addChild(nina)
        nina.zPosition = 100
    }
    
    func setupDonna() {
        donna = SKSpriteNode(imageNamed: "iddleFront")
        donna.size = CGSize(width: 1000, height: 1000)
        donna.position = CGPoint(x: chair.position.x, y: chair.position.y + chair.frame.height/2 + donna.frame.height/2 - 50)
        addChild(donna)
        donna.zPosition = 99
    }
    
    func setupSounds() {
        backgroundMusic.autoplayLooped = true
        backgroundMusic.isPositional = false
        addChild(backgroundMusic)
        
        stepsSound1.run(SKAction.changeVolume(to: 0.5, duration: 0.0))
        stepsSound2.run(SKAction.changeVolume(to: 0.5, duration: 0.0))
        stepsSound1.autoplayLooped = false
        stepsSound2.autoplayLooped = false
        nina.addChild(stepsSound1)
        nina.addChild(stepsSound2)
        
        jumpSound.run(SKAction.changeVolume(to: 0.5, duration: 0.0))
        jumpSound.autoplayLooped = false
        nina.addChild(jumpSound)
        
        landedSound.run(SKAction.changeVolume(to: 0.5, duration: 0.0))
        landedSound.autoplayLooped = false
        nina.addChild(landedSound)
        
    }
}
