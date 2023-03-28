//
//  GameScene.swift
//  Miau Little Helper
//
//  Created by rsbj on 20/03/23.
//

import SpriteKit
import Speech

class GameScene: SKScene {
    
    var nina: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        print("colocou cena")
        
        setupNina()
    }
    
    func setupNina() {
        
        let textureAnimation = SKAction.animate(with: ninaMovementTexture, timePerFrame: 0.1)
        let walk = SKAction.repeatForever(textureAnimation)
        
        nina = SKSpriteNode(imageNamed: "nina1")
        nina.size = CGSize(width: 200, height: 150)
        nina.position = CGPoint(x: 400, y: 300)
        
        nina.run(walk)
        
        addChild(nina)
        
    }
}
