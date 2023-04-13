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
    var isNinaAwake = false
    var onboarding = false
    var isListening = SKLabelNode(text: "!")
    var donnaAttention = SKLabelNode(text: "!")
    
    var currentRoom = 1
    var cameraNode = Camera()
    

    var clothesObstacle = SKSpriteNode(texture: SKTexture(imageNamed: "doorObstacle1.png"), size: CGSize(width: 588, height: 426))
    var lightSwitch = SKSpriteNode(imageNamed: "lightswitch1")
    var pan = SKSpriteNode(texture: SKTexture(imageNamed: "pan1"), size: CGSize(width: 576, height: 1728))
    var zz = SKSpriteNode(texture: SKTexture(imageNamed: "ZZ1"), size: CGSize(width: 200, height: 200))
    
    var backgroundMusic = SKAudioNode(fileNamed: "backgroundMusic.wav")
    var stepsSound1 = SKAudioNode(fileNamed: "steps.wav")
    var stepsSound2 = SKAudioNode(fileNamed:"steps.wav")
    var interationSound = SKAudioNode(fileNamed: "steps.wav")
    var jumpSound = SKAudioNode(fileNamed: "jump.wav")
    var landedSound = SKAudioNode(fileNamed: "landed.wav")
    
    var lampCover = SKSpriteNode(color: UIColor(named: "wall")!, size: CGSize(width: 200, height: 200))
    var chair = SKSpriteNode(texture: SKTexture(imageNamed: "chair"))
    var lamp = SKSpriteNode(color: .clear, size: CGSize(width: 200, height: 400))
    var cooker = SKSpriteNode(color: .clear, size: CGSize(width: 860, height: 950))
    
    override func didMove(to view: SKView) {
        voiceRecognizer.requestPermission()
        setupCamera()
        setupWindows()
        setupBackground()
        setupLivingRoom()
        setupKitchen()
        setupDonna()
        setupNina()
        setupRoom()
        setupSounds()
        setupChatBox()
        
        chatLabel.text = "O gatinho Nina caiu no sono! Fale ‘Nina, acorde!’ ou toque nele para fazê-lo levantar!"
    }
    
    override func update(_ currentTime: TimeInterval) {
        if pause {
            backgroundMusic.run(SKAction.changeVolume(to: 0.0, duration: 0.0))
            stepsSound1.run(SKAction.changeVolume(to: 0.0, duration: 0.0))
            stepsSound2.run(SKAction.changeVolume(to: 0.0, duration: 0.0))
            jumpSound.run(SKAction.changeVolume(to: 0.0, duration: 0.0))
            landedSound.run(SKAction.changeVolume(to: 0.0, duration: 0.0))
            interationSound.run(SKAction.changeVolume(to: 0.0, duration: 0.0))
        }
        else {
            voiceCommand()
            backgroundMusic.run(SKAction.changeVolume(to: Float(volumeMusic), duration: 0.0))
            stepsSound1.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
            stepsSound2.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
            jumpSound.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
            landedSound.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))

            chatBox.position.x = cameraNode.position.x
            chatLabel.position = chatBox.position

            interationSound.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))

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
        background1 = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.height * 4 / 3, height: self.frame.height))
        background2 = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.height * 4 / 3, height: self.frame.height))
        background3 = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.height * 4 / 3, height: self.frame.height))
        
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
        nina = SKSpriteNode(imageNamed: "waking1")
        nina.run(SKAction.repeatForever(sleeping), withKey: "ninaSleeping")
        nina.name = "nina"
        nina.size = CGSize(width: 400, height: 300)
        nina.position = CGPoint(x: 500, y: shelfWall3.position.y + shelfWall3.frame.height/2 + nina.frame.height/2)
        addChild(nina)
        nina.zPosition = 99
        
        isListening.fontColor = .clear
        isListening.fontName = "Greybeard22pxBold"
        isListening.fontSize = 150
        
        zz.run(zzAnimation, withKey: "zzAnimation")
        zz.position = CGPoint(x: nina.position.x + 150, y: nina.position.y + nina.frame.height/2)
        
        addChild(isListening)
        addChild(zz)
    }
    
    func setupDonna() {

        donna.name = "donna"
        donna.run(donnaLampAnimation, withKey: "donnaLampAnimation")
        donna.size = CGSize(width: 1000, height: 1000)
        donna.position = CGPoint(x: chair.position.x + 20, y: chair.position.y + chair.frame.height/2 + donna.frame.height/2 - 100)
        addChild(donna)
        donna.zPosition = 99
        
        donnaAttention.fontColor = .clear
        donnaAttention.fontName = "Greybeard22pxBold"
        donnaAttention.fontSize = 350
        
        addChild(donnaAttention)
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
        
        interationSound.run(SKAction.changeVolume(to: Float(volumeEffects), duration: 0.0))
        interationSound.autoplayLooped = false
        nina.addChild(interationSound)
    }
    
    func setupChatBox() {
        chatBox = SKSpriteNode(imageNamed: "buttonBgWide")
        chatBox.position.x = cameraNode.position.x
        chatBox.zPosition = 101
        chatBox.size = CGSize(width: 3750, height: 800)
        
        chatLabel.position.x = chatBox.position.x
        chatLabel = SKLabelNode(fontNamed: "Greybeard22pxBold")
        chatLabel.horizontalAlignmentMode = .center
        chatLabel.fontSize = 150
        chatLabel.zPosition = 102
        chatLabel.numberOfLines = 0
        chatLabel.preferredMaxLayoutWidth = 3400
        chatLabel.lineBreakMode = .byCharWrapping
        chatLabel.verticalAlignmentMode = .center

        addChild(chatBox)
        addChild(chatLabel)
        
    }
    
}
