//
//  LivingRoom.swift
//  Miau Little Helper
//
//  Created by rsbj on 29/03/23.
//

import SpriteKit

extension GameScene {
  
    var sofa : SKSpriteNode {
        let sofa = SKSpriteNode(color: .red, size: CGSize(width: 790, height: 600))
        sofa.position = CGPoint(x: 6000 + sofa.frame.width/2, y: sofa.frame.height/2 + 260)
        sofa.name = "sofa"
        return sofa
    }
    
    var sofaTop : SKSpriteNode {
        let sofaTop = SKSpriteNode(color: .red, size: CGSize(width: 400, height: 400))
        sofaTop.position = CGPoint(x: 6450 + sofaTop.frame.width/2, y: sofaTop.frame.height/2 + 850)
        sofaTop.name = "sofaTop"
        return sofaTop
    }
    
    var tv : SKSpriteNode {
        let tv = SKSpriteNode(color: .yellow, size: CGSize(width: 400, height: 500))
        tv.position = CGPoint(x: 4100 + tv.frame.width/2, y: tv.frame.height/2 + 600)
        tv.name = "tv"
        return tv
    }
    
    var lamp : SKSpriteNode {
        let lampada = SKSpriteNode(color: .yellow, size: CGSize(width: 200, height: 400))
        lampada.position = CGPoint(x: 5300 + lampada.frame.width/2, y: lampada.frame.height/2 + 1900)
        lampada.name = "lampada"
        return lampada
    }
    
    var doorLivingRoom : SKSpriteNode {
        let doorLivingRoom = SKSpriteNode(color: .red, size: CGSize(width: 900, height: 1800))
        doorLivingRoom.position = CGPoint(x: 4500 + doorLivingRoom.frame.width/2, y: doorLivingRoom.frame.height/2 + 260)
        doorLivingRoom.name = "lampada"
        return doorLivingRoom
    }
    
    func setupLivingRoom() {
        addChild(doorLivingRoom)
        addChild(sofa)
        addChild(sofaTop)
        addChild(tv)
        addChild(lamp)
    }
    
}
