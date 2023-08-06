//
//  Windows.swift
//  Miau Little Helper
//
//  Created by vko on 12/04/23.
//

import SpriteKit

extension GameScene {
    
    func setupWindows() {
        
        var BedWindowDay: SKSpriteNode {
            let bedWindowDay = SKSpriteNode(imageNamed: "bedWindowDay")
            bedWindowDay.size = CGSize(width: 1210, height: 1210)
            bedWindowDay.position = CGPoint(x: 1850, y: 2010)
            bedWindowDay.name = "bedWindowDay"
            return bedWindowDay
            
        }
        
        var BedWindowNight: SKSpriteNode {
            let bedWindowNight = SKSpriteNode(imageNamed: "bedWindowNight")
            bedWindowNight.size = CGSize(width: 1210, height: 1210)
            bedWindowNight.position = CGPoint(x: 1850, y: 2010)
            bedWindowNight.name = "bedWindowNight"
            return bedWindowNight
            
        }

        var DoorWindowDay: SKSpriteNode {
            let doorWindowDay = SKSpriteNode(imageNamed: "doorWindowDay")
            doorWindowDay.size = CGSize(width: 605, height: 605)
            doorWindowDay.position = CGPoint(x: 5000, y: 1600)
            doorWindowDay.name = "doorWindowDay"
            return doorWindowDay
            
        }
        
        var DoorWindowNight: SKSpriteNode {
            let doorWindowNight = SKSpriteNode(imageNamed: "doorWindowNight")
            doorWindowNight.size = CGSize(width: 605, height: 605)
            doorWindowNight.position = CGPoint(x: 5000, y: 1600)
            doorWindowNight.name = "doorWindowNight"
            return doorWindowNight
            
        }
        
        var KitchenWindowDay: SKSpriteNode {
            let kitchenWindowDay = SKSpriteNode(imageNamed: "kitchenWindowDay")
            kitchenWindowDay.size = CGSize(width: 1210, height: 1210)
            kitchenWindowDay.position = CGPoint(x: 9300, y: 2010)
            kitchenWindowDay.name = "kitchenWindowDay"
            return kitchenWindowDay
            
        }
        
        var KitchenWindowNight: SKSpriteNode {
            let kitchenWindowNight = SKSpriteNode(imageNamed: "kitchenWindowNight")
            kitchenWindowNight.size = CGSize(width: 1210, height: 1210)
            kitchenWindowNight.position = CGPoint(x: 9300, y: 2010)
            kitchenWindowNight.name = "kitchenWindowNight"
            return kitchenWindowNight
            
        }

        let today  = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
     
        if ((Int(formatter.string(from: today)) ?? 0) <= 6) {
            addChild(BedWindowNight)
            addChild(KitchenWindowNight)
            addChild(DoorWindowNight)
        } else if ((Int(formatter.string(from: today)) ?? 0) >= 18){
            addChild(BedWindowNight)
            addChild(KitchenWindowNight)
            addChild(DoorWindowNight)
        } else {
            addChild(BedWindowDay)
            addChild(KitchenWindowDay)
            addChild(DoorWindowDay)
        }
        
    }
}
