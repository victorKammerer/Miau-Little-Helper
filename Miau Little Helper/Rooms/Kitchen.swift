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
        machine.position = CGPoint(x: 10780 + machine.frame.width/2, y: machine.frame.height/2 + 260)
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
    
    var cooker : SKSpriteNode {
        let cooker = SKSpriteNode(color: .clear, size: CGSize(width: 870, height: 950))
        cooker.position = CGPoint(x: 9120 + cooker.frame.width/2, y: cooker.frame.height/2 + 260)
        cooker.name = "cooker"
        return cooker
    }
//
//    var sink : SKSpriteNode {
//        let sink = SKSpriteNode(color: .blue, size: CGSize(width: 1350, height: 850))
//        sink.position = CGPoint(x: 7760 + sink.frame.width/2, y: sink.frame.height/2 + 260)
//        sink.name = "sink"
//        return sink
//    }
    
//    var freezer : SKSpriteNode {
//        let freezer = SKSpriteNode(color: .brown, size: CGSize(width: 890, height: 1700))
//        freezer.position = CGPoint(x: 6860 + freezer.frame.width/2, y: freezer.frame.height/2 + 260)
//        freezer.name = "freezer"
//        return freezer
//    }
    
    // 72 por 30 || 172 a partir da parede
    
    var kitchenWindow : SKSpriteNode {
        let kitchenWindow = SKSpriteNode(color: .clear, size: CGSize(width: 1350, height: 1250))
        kitchenWindow.position = CGPoint(x: 8610 + kitchenWindow.frame.width/2, y: kitchenWindow.frame.height/2 + 1400)
        kitchenWindow.name = "kitchenWindow"
        return kitchenWindow
    }
    
    func setupKitchen() {
        addChild(washMachine)
        addChild(kitchenShelf)
        addChild(cooker)
//        addChild(sink)
//        addChild(freezer)
        addChild(kitchenWindow)
        addChild(kitchenShelf2)
        addChild(kitchenShelf3)
    }
}
