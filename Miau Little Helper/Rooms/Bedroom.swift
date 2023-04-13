//
// Room.swift
// Miau Little Helper
//
// Created by Jpsmor on 28/03/23.
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
        let door = SKSpriteNode(color: .clear, size: CGSize(width: 700, height: 2800))
        door.position = CGPoint(x: 4000 - door.frame.width/2, y: door.frame.height/2 + 100)
        door.name = "door"
        return door
    }
    var doorAsset : SKSpriteNode {
        let door = SKSpriteNode(imageNamed: "door")
        door.texture!.filteringMode = SKTextureFilteringMode.nearest
        door.size = CGSize(width: 412, height: backgroundCompleto.size.height)
        door.position = CGPoint(x: 3800 - door.frame.width/2, y: door.frame.height/2)
        door.zPosition = 99
        door.name = "door"
        return door
    }
    var bed : SKSpriteNode {
        let bed = SKSpriteNode(color: .clear, size: CGSize(width: 1800, height: 350))
        bed.position = CGPoint(x: bed.frame.width/2 + 250, y: bed.frame.height/2 + 280)
        bed.name = "bed"
        return bed
    }
    
    var shelfWall3 : SKSpriteNode {
        let shelfWall = SKSpriteNode(color: .clear, size: CGSize(width: 650, height: 85))
        shelfWall.position = CGPoint(x: shelfWall.frame.width/2 + 310, y: shelfWall.frame.height/2 + 1220)
        shelfWall.name = "shelfWall"
        return shelfWall
    }
    var mess : SKSpriteNode {
        let mess = SKSpriteNode(imageNamed: "obstacle")
        mess.size = CGSize(width: 600, height: 450)
        mess.position = CGPoint(x: 650, y: mess.frame.height/2 + 70)
        mess.name = "pile"
        return mess
    }
    var toy : SKSpriteNode {
        let toy = SKSpriteNode(color: .clear, size: CGSize(width: 650, height: 280))
        toy.position = CGPoint(x: 950, y: toy.frame.height/2 + 1600)
        toy.name = "toy"
        return toy
    }
    var plant : SKSpriteNode {
        let plant = SKSpriteNode(color: .clear, size: CGSize(width: 650, height: 280))
        plant.position = CGPoint(x: 650, y: plant.frame.height/2 + 1900)
        plant.name = "plant"
        return plant
    }
    var ditto : SKSpriteNode {
        let ditto = SKSpriteNode(color: .clear, size: CGSize(width: 280, height: 250))
        ditto.position = CGPoint(x: 3080, y: ditto.frame.height/2 + 1300)
        ditto.name = "ditto"
        return ditto
    }
    var perfume : SKSpriteNode {
        let perfume = SKSpriteNode(color: .clear, size: CGSize(width: 200, height: 200))
        perfume.position = CGPoint(x: 2800, y: perfume.frame.height/2 + 1300)
        perfume.name = "perfume"
        return perfume
    }
    var clothes : SKSpriteNode {
        let clothes = SKSpriteNode(color: .clear, size: CGSize(width: 290, height: 230))
        clothes.position = CGPoint(x: 3000, y: clothes.frame.height/2 + 950)
        clothes.name = "clothes"
        return clothes
    }
    var plant2 : SKSpriteNode {
        let plant = SKSpriteNode(color: .clear, size: CGSize(width: 290, height: 230))
        plant.position = CGPoint(x: 2800, y: plant.frame.height/2 + 700)
        plant.name = "plant2"
        return plant
    }
    var window : SKSpriteNode {
        let window = SKSpriteNode(color: .clear, size: CGSize(width: 1200, height: 1200))
        window.position = CGPoint(x: 1850, y: window.frame.height/2 + 1400)
        window.name = "window"
        return window
    }
    func setupRoom() {
        //    bed.position = CGPoint(x: CGRectGetMaxX(self.frame), y: CGRectGetMaxY(self.frame))
        clothesObstacle.position = CGPoint(x: clothesObstacle.frame.width/2 + 2800, y: clothesObstacle.frame.height/2 + 100)
        clothesObstacle.name = "obstacle"
        addChild(bed)
        //    addChild(shelfWall)
        //    addChild(shelfWall2)
        addChild(shelfWall3)
        addChild(window)
        addChild(door)
        addChild(floor)
        addChild(clothesObstacle)
        addChild(mess)
        addChild(toy)
        addChild(plant)
        addChild(perfume)
        addChild(ditto)
        addChild(clothes)
        addChild(plant2)
        addChild(doorAsset)
    }
}
