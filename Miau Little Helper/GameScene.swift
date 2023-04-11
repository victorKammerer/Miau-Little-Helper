//
//  GameScene.swift
//  Miau Little Helper
//
//  Created by rsbj on 20/03/23.
//

import SpriteKit
import Speech
import SwiftUI


class GameScene: SKScene {
    @AppStorage("pause") var pause: Bool = false
    @AppStorage("volumeMusic") var volumeMusic: Double = 1.0
    @AppStorage("volumeEffects") var volumeEffects: Double = 1.0

    var voiceRecognizer = VoiceRecognizer()
    var backgroundCompleto = SKSpriteNode()
    var background1 = SKSpriteNode()
    var background2 = SKSpriteNode()
    var background3 = SKSpriteNode()
    var nina = SKSpriteNode()
    
    var chatBox = SKSpriteNode()
    var chatLabel = SKLabelNode()
    var textIsShowing = true
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
        setupChatBox()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if pause {
            backgroundMusic.run(SKAction.changeVolume(to: 0.0, duration: 0.0))
            stepsSound1.run(SKAction.changeVolume(to: 0.0, duration: 0.0))
            stepsSound2.run(SKAction.changeVolume(to: 0.0, duration: 0.0))
            jumpSound.run(SKAction.changeVolume(to: 0.0, duration: 0.0))
            landedSound.run(SKAction.changeVolume(to: 0.0, duration: 0.0))
        }
        else {
            voiceCommand()
            backgroundMusic.run(SKAction.changeVolume(to: Float(volumeMusic), duration: 0.0))
            stepsSound1.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
            stepsSound2.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
            jumpSound.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
            landedSound.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
            if nina.position.y > self.frame.midY {
                chatBox.position.y = self.frame.minY + 600
                chatLabel.position = chatBox.position
            }
            else {
                chatBox.position.y = self.frame.maxY - 800
                chatLabel.position = chatBox.position
            }
            
            if textIsShowing {
                chatBox.isHidden = false
                chatLabel.isHidden = false
            }
            else {
                chatBox.isHidden = true
                chatLabel.isHidden = true
            }
        }
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
        backgroundMusic.run(SKAction.changeVolume(to: Float(volumeMusic), duration: 0.0))
        addChild(backgroundMusic)
        
        stepsSound1.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
        stepsSound2.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
        stepsSound1.autoplayLooped = false
        stepsSound2.autoplayLooped = false
        nina.addChild(stepsSound1)
        nina.addChild(stepsSound2)
        
        jumpSound.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
        jumpSound.autoplayLooped = false
        nina.addChild(jumpSound)
        
        landedSound.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
        landedSound.autoplayLooped = false
        nina.addChild(landedSound)
        
    }
    
    func setupChatBox() {
        chatBox = SKSpriteNode(imageNamed: "buttonBgWide")
        chatBox.position.x = cameraNode.position.x
        chatBox.size = CGSize(width: 3750, height: 800)
        
        chatLabel.position.x = chatBox.position.x
        chatLabel = SKLabelNode(fontNamed: "Greybeard22pxBold")
        chatLabel.horizontalAlignmentMode = .center
        chatLabel.fontSize = 180
        chatLabel.zPosition = 10
        chatLabel.numberOfLines = 0
        chatLabel.preferredMaxLayoutWidth = 3600
        chatLabel.lineBreakMode = .byCharWrapping
        chatLabel.verticalAlignmentMode = .center

        addChild(chatBox)
        addChild(chatLabel)
        
    }
    
}
