//
//  Kitchen.swift
//  Miau Little Helper
//
//  Created by rsbj on 29/03/23.
//

import SpriteKit

extension GameScene {
    
    var washMachine : SKSpriteNode {
        let machine = SKSpriteNode(color: .clear
                                   , size: CGSize(width: 850, height: 950))
        machine.position = CGPoint(x: 10820 + machine.frame.width/2, y: machine.frame.height/2 + 260)
        machine.name = "washMachine"
        return machine
    }
    
    var kitchenShelf : SKSpriteNode {
        let shelf = SKSpriteNode(color: .clear, size: CGSize(width: 765, height: 320))
        shelf.position = CGPoint(x: 10040 + shelf.frame.width/2, y: shelf.frame.height/2 + 260)
        shelf.name = "kitchenShelf"
        return shelf
    }
    
    var kitchenShelf2 : SKSpriteNode {
        let shelf = SKSpriteNode(color: .clear, size: CGSize(width: 765, height: 300))
        shelf.position = CGPoint(x: 10040 + shelf.frame.width/2, y: shelf.frame.height/2 + 580)
        shelf.name = "kitchenShelf"
        return shelf
    }
    
    var kitchenShelf3 : SKSpriteNode {
        let shelf = SKSpriteNode(color: .clear, size: CGSize(width: 765, height: 310))
        shelf.position = CGPoint(x: 10040 + shelf.frame.width/2, y: shelf.frame.height/2 + 840)
        shelf.name = "kitchenShelf"
        return shelf
    }

    var sink : SKSpriteNode {
        let sink = SKSpriteNode(color: .clear, size: CGSize(width: 1350, height: 1100))
        sink.position = CGPoint(x: 7830 + sink.frame.width/2, y: sink.frame.height/2 + 260)
        sink.name = "sink"
        return sink
    }
    
//    var freezer : SKSpriteNode {
//        let freezer = SKSpriteNode(color: .brown, size: CGSize(width: 890, height: 1700))
//        freezer.position = CGPoint(x: 6860 + freezer.frame.width/2, y: freezer.frame.height/2 + 260)
//        freezer.name = "freezer"
//        return freezer
//    }
    
    // 72 por 30 || 172 a partir da parede
    
    var kitchenWindow : SKSpriteNode {
        let kitchenWindow = SKSpriteNode(color: .clear, size: CGSize(width: 1350, height: 1250))
        kitchenWindow.position = CGPoint(x: 8700 + kitchenWindow.frame.width/2, y: kitchenWindow.frame.height/2 + 1400)
        kitchenWindow.name = "kitchenWindow"
        return kitchenWindow
    }
    
    var cabinet2 : SKSpriteNode {
        let cabinet = SKSpriteNode(color: .clear, size: CGSize(width: 1660, height: 600))
        cabinet.position = CGPoint(x: 10030 + cabinet.frame.width/2, y: cabinet.frame.height/2 + 2050)
        cabinet.name = "cabinet"
        return cabinet
    }
    
    var spices : SKSpriteNode {
        let spices = SKSpriteNode(color: .clear, size: CGSize(width: 765, height: 510))
        spices.position = CGPoint(x: 10040 + spices.frame.width/2, y: spices.frame.height/2 + 1180)
        spices.name = "spices"
        return spices
    }
    
    func setupPan() {
        pan.position = CGPoint(x: cooker.position.x + 50, y: cooker.position.y + cooker.frame.height/2 + pan.frame.height/2 - 105)
        pan.run(panAnimation, withKey: "panAnimation")
        pan.name = "cooker"
        addChild(pan)
    }
    
    func setupKitchen() {
        cooker.position = CGPoint(x: 9220 + cooker.frame.width/2, y: cooker.frame.height/2 + 260)
        cooker.name = "cooker"
        
        setupPan()
        addChild(washMachine)
        addChild(kitchenShelf)
        addChild(cooker)
        addChild(sink)
//        addChild(freezer)
        addChild(kitchenWindow)
        addChild(kitchenShelf2)
        addChild(kitchenShelf3)
        addChild(cabinet2)
        addChild(spices)
    }
}
