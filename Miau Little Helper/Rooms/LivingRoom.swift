//
//  LivingRoom.swift
//  Miau Little Helper
//
//  Created by rsbj on 29/03/23.
//

import SpriteKit

extension GameScene {
    
    var sofa : SKSpriteNode {
        let sofa = SKSpriteNode(color: .clear, size: CGSize(width: 790, height: 600))
        sofa.position = CGPoint(x: 6000 + sofa.frame.width/2, y: sofa.frame.height/2 + 260)
        sofa.name = "sofa"
        return sofa
    }
    
    var sofaTop : SKSpriteNode {
        let sofaTop = SKSpriteNode(color: .clear, size: CGSize(width: 400, height: 400))
        sofaTop.position = CGPoint(x: 6450 + sofaTop.frame.width/2, y: sofaTop.frame.height/2 + 850)
        sofaTop.name = "sofa"
        return sofaTop
    }
    
    var tv : SKSpriteNode {
        let tv = SKSpriteNode(color: .clear, size: CGSize(width: 400, height: 500))
        tv.position = CGPoint(x: 4100 + tv.frame.width/2, y: tv.frame.height/2 + 600)
        tv.name = "tv"
        return tv
    }
    
    var livingChelf : SKSpriteNode {
        let livingChelf = SKSpriteNode(color: .clear, size: CGSize(width: 700, height: 600))
        livingChelf.position = CGPoint(x: 5700 + livingChelf.frame.width/2, y: livingChelf.frame.height/2 + 1400)
        livingChelf.name = "livingChelf"
        return livingChelf
    }
    
    var doorLivingRoom : SKSpriteNode {
        let doorLivingRoom = SKSpriteNode(color: .clear, size: CGSize(width: 900, height: 1800))
        doorLivingRoom.position = CGPoint(x: 4500 + doorLivingRoom.frame.width/2, y: doorLivingRoom.frame.height/2 + 260)
        doorLivingRoom.name = "doorLivingRoom"
        return doorLivingRoom
    }
    
    var kitchenNode : SKSpriteNode {
        let kitchenNode = SKSpriteNode(color: .clear, size: CGSize(width: 500, height: 2500))
        kitchenNode.position = CGPoint(x: 7500 + kitchenNode.frame.width/2, y: kitchenNode.frame.height/2 + 100)
        kitchenNode.zPosition = 2
        kitchenNode.name = "kitchenNode"
        return kitchenNode
    }
    
    var cactus : SKSpriteNode {
        let cactus = SKSpriteNode(color: .clear, size: CGSize(width: 200, height: 250))
        cactus.position = CGPoint(x: 3850 + tv.frame.width/2, y: cactus.frame.height/2 + 600)
        cactus.name = "cactus"
        return cactus
    }
    
    var freezer : SKSpriteNode {
        let freezer = SKSpriteNode(color: .clear, size: CGSize(width: 890, height: 1700))
        freezer.position = CGPoint(x: 7000 + freezer.frame.width/2, y: freezer.frame.height/2 + 260)
        freezer.name = "freezer"
        return freezer
    }
    
    var cabinet : SKSpriteNode {
        let cabinet = SKSpriteNode(color: .clear, size: CGSize(width: 1660, height: 600))
        cabinet.position = CGPoint(x: 7030 + cabinet.frame.width/2, y: cabinet.frame.height/2 + 2050)
        cabinet.name = "cabinet"
        return cabinet
    }
    
    func setupLightSwitch() {
        lightSwitch.texture!.filteringMode = SKTextureFilteringMode.nearest
        lightSwitch.size = CGSize(width: 100, height: 270)
        lightSwitch.position = CGPoint(x: 6800 + lightSwitch.frame.width/2, y: lightSwitch.frame.height/2 + 1400)
        lightSwitch.name = "lightswitch"
    }
    
    func setupLivingRoom() {
        lampCover.position = CGPoint(x: 5500 + lampCover.frame.width/2, y: lampCover.frame.height/2 + 1750)
        lampCover.name = "lamp"
        chair.position = CGPoint(x: 5500 + lamp.frame.width/2, y: chair.frame.height/2 + 400)
        chair.name = "chair"
        chair.size = CGSize(width: chair.size.width * 1.5, height: chair.size.height * 1.5)
        lamp.position = CGPoint(x: 5500 + lamp.frame.width/2, y: lamp.frame.height/2 + 1900)
        lamp.name = "lamp"
        
        setupLightSwitch()
        addChild(doorLivingRoom)
        addChild(sofa)
        addChild(sofaTop)
        addChild(tv)
        addChild(lamp)
        addChild(chair)
        addChild(lightSwitch)
        addChild(cactus)
        addChild(freezer)
        addChild(cabinet)
        addChild(kitchenNode)
        addChild(livingChelf)
        addChild(lampCover)
    }
    
}
