//
//  Room.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 28/03/23.
//

import SpriteKit

extension GameScene {

    
    var floor : SKSpriteNode {
        let floor = SKSpriteNode(color: .clear
                                 , size: CGSize(width: 12000, height: 100))
        floor.position = CGPoint(x:floor.frame.width/2, y: floor.frame.height/2)
        floor.name = "floor"
        return floor
    }
    
    var door : SKSpriteNode {
        let door = SKSpriteNode(color: .red, size: CGSize(width: 300, height: 2800))
        door.position = CGPoint(x: 3950 - door.frame.width/2, y: door.frame.height/2 + 100)
        door.name = "door"
        return door
    }
    
    var bed : SKSpriteNode {
        let bed = SKSpriteNode(color: .clear, size: CGSize(width: 1800, height: 350))
        bed.position = CGPoint(x: bed.frame.width/2 + 250, y: bed.frame.height/2 + 280)
        bed.name = "bed"
        return bed
    }
    
//    var shelfWall : SKSpriteNode {
//        let shelfWall = SKSpriteNode(color: .clear, size: CGSize(width: 720, height: 100))
//        shelfWall.position = CGPoint(x: shelfWall.frame.width/2 + 300, y: shelfWall.frame.height/2 + 1900)
//        shelfWall.name = "shelfWall"
//        return shelfWall
//    }
//
//    var shelfWall2 : SKSpriteNode {
//        let shelfWall = SKSpriteNode(color: .cyan, size: CGSize(width: 720, height: 100))
//        shelfWall.position = CGPoint(x: shelfWall.frame.width/2 + 600, y: shelfWall.frame.height/2 + 1600)
//        shelfWall.name = "shelfWall"
//        return shelfWall
//    }
    
    var shelfWall3 : SKSpriteNode {
        let shelfWall = SKSpriteNode(color: .clear, size: CGSize(width: 650, height: 85))
        shelfWall.position = CGPoint(x: shelfWall.frame.width/2 + 310, y: shelfWall.frame.height/2 + 1220)
        shelfWall.name = "shelfWall"
        return shelfWall
    }
    
    var mess : SKSpriteNode {
        return SKSpriteNode(color: .cyan, size: CGSize(width: 200, height: 200))
    }
    
    var window : SKSpriteNode {
        let window = SKSpriteNode(color: .clear, size: CGSize(width: 1000, height: 1000))
        window.position = CGPoint(x: 2000, y: window.frame.height/2 + 1000)
        window.name = "window"
        return window
    }
    
    func setupRoom() {
//        bed.position = CGPoint(x: CGRectGetMaxX(self.frame), y: CGRectGetMaxY(self.frame))
        clothesObstacle.position = CGPoint(x: clothesObstacle.frame.width/2 + 2800, y: clothesObstacle.frame.height/2 + 100)
        clothesObstacle.name = "obstacle"
        addChild(bed)
//        addChild(shelfWall)
//        addChild(shelfWall2)
        addChild(shelfWall3)
        addChild(window)
        addChild(door)
        addChild(floor)
        addChild(clothesObstacle)
    }
}
