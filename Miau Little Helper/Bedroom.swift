//
//  Room.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 28/03/23.
//

import SpriteKit

extension GameScene {
    
    var numero : Int {
        return 1
    }
    
    var floor : SKSpriteNode {
        let floor = SKSpriteNode(color: .green, size: CGSize(width: 12000, height: 100))
        floor.position = CGPoint(x:floor.frame.width/2, y: floor.frame.height)
        floor.name = "floor"
        return floor
    }
    
    var door : SKSpriteNode {
        let door = SKSpriteNode(color: .brown, size: CGSize(width: 100, height: 2800))
        door.position = CGPoint(x: 3950 - door.frame.width/2, y: door.frame.height/2 + 100)
        door.name = "door"
        return door
    }
    
    var bed : SKSpriteNode {
        let bed = SKSpriteNode(color: .brown, size: CGSize(width: 2500, height: 700))
        bed.position = CGPoint(x: bed.frame.width/2 + 200, y: bed.frame.height/2 + 100)
        bed.name = "bed"
        return bed
    }
    
    var shelf : SKSpriteNode {
        let shelf = SKSpriteNode(color: .brown, size: CGSize(width: 1000, height: 2500))
        shelf.position = CGPoint(x: 3750 - shelf.frame.width/2, y: shelf.frame.height/2 + 100)
        shelf.name = "shelf"
        return shelf
    }
    
    var shelfWall : SKSpriteNode {
        let shelfWall = SKSpriteNode(color: .cyan, size: CGSize(width: 720, height: 100))
        shelfWall.position = CGPoint(x: shelfWall.frame.width/2 + 200, y: shelfWall.frame.width/2 + 2050)
        shelfWall.name = "shelfWall"
        return shelfWall
    }
    
    var shelfWall2 : SKSpriteNode {
        let shelfWall = SKSpriteNode(color: .cyan, size: CGSize(width: 720, height: 100))
        shelfWall.position = CGPoint(x: shelfWall.frame.width/2 + 600, y: shelfWall.frame.width/2 + 1600)
        shelfWall.name = "shelfWall2"
        return shelfWall
    }
    
    var shelfWall3 : SKSpriteNode {
        let shelfWall = SKSpriteNode(color: .cyan, size: CGSize(width: 720, height: 100))
        shelfWall.position = CGPoint(x: shelfWall.frame.width/2 + 200, y: shelfWall.frame.width/2 + 1150)
        shelfWall.name = "shelfWall3"
        return shelfWall
    }
    
    var mess : SKSpriteNode {
        return SKSpriteNode(color: .cyan, size: CGSize(width: 200, height: 200))
    }
    
    var clothesObstacle : SKSpriteNode {
        return SKSpriteNode(color: .cyan, size: CGSize(width: 200, height: 200))
    }
    
    var window : SKSpriteNode {
        let window = SKSpriteNode(color: .gray, size: CGSize(width: 1000, height: 1000))
        window.position = CGPoint(x: 2000, y: window.frame.height/2 + 1000)
//        window.drawBorder(color: .yellow, width: 8)
        window.name = "window"
        return window
    }
    
    func setupRoom() {
//        bed.position = CGPoint(x: CGRectGetMaxX(self.frame), y: CGRectGetMaxY(self.frame))
        addChild(bed)
        addChild(shelfWall)
        addChild(shelfWall2)
        addChild(shelfWall3)
        addChild(window)
        addChild(shelf)
        addChild(door)
        addChild(floor)
    }
}
