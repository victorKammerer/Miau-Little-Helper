//
//  Sprites.swift
//  Miau Little Helper
//
//  Created by vko on 28/03/23.
//

import SpriteKit

extension GameScene {
    var ninaAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "nina")
    }
    
    var ninaMovementTexture: [SKTexture] {
        return [
            ninaAtlas.textureNamed("nina1"),
            ninaAtlas.textureNamed("nina2"),
            ninaAtlas.textureNamed("nina3"),
            ninaAtlas.textureNamed("nina4")
        ]
    }
    
    var ninaJumpAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "ninaJump")
    }
    
    var ninaImpulseTexture: [SKTexture] {
        return [
            ninaJumpAtlas.textureNamed("jump1"),
            ninaJumpAtlas.textureNamed("jump2"),
            ninaJumpAtlas.textureNamed("jump3"),
            ninaJumpAtlas.textureNamed("jump4"),
            ninaJumpAtlas.textureNamed("jump5"),
            ninaJumpAtlas.textureNamed("jump6")
        ]
    }
    
    var ninaLandingTexture: [SKTexture] {
        return [
            ninaJumpAtlas.textureNamed("jump8"),
            ninaJumpAtlas.textureNamed("jump8"),
            ninaJumpAtlas.textureNamed("jump10")
            ]
    }
    
    var ninaWakingAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "ninaWaking")
    }
    
    var ninaWakingTexture: [SKTexture] {
        var ninaWakingTexture : [SKTexture] = []
        for i in 1...ninaWakingAtlas.textureNames.count {
            let textureName = "waking\(i)"
            ninaWakingTexture.append(ninaWakingAtlas.textureNamed(textureName))
        }
        return ninaWakingTexture
    }
    
    var ninaSleepingAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "ninaSleeping")
    }
    
    var ninaSleepingTexture: [SKTexture] {
        return  [
            ninaSleepingAtlas.textureNamed("sleeping1"),
            ninaSleepingAtlas.textureNamed("sleeping2")
        ]
    }
    
    var ninaInteractAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "ninaInteracting")
    }
    
    var ninaInteractTexture: [SKTexture] {
        var ninaInteractTexture : [SKTexture] = []
        for i in 1...ninaInteractAtlas.textureNames.count {
            let textureName = "bulinando\(i)"
            ninaInteractTexture.append(ninaInteractAtlas.textureNamed(textureName))
        }
        return ninaInteractTexture
    }
    
    var panAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "pan")
    }
    
    var panTexture: [SKTexture] {
        var panTexture : [SKTexture] = []
        for i in 1...panAtlas.textureNames.count {
            let textureName = "pan\(i)"
            panTexture.append(panAtlas.textureNamed(textureName))
        }
        return panTexture
    }
    
    var panSolvedAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "panSolved")
    }
    
    var panSolvedTexture: [SKTexture] {
        var panSolvedTexture : [SKTexture] = []
        for i in 1...panSolvedAtlas.textureNames.count {
            let textureName = "panSolved\(i)"
            panSolvedTexture.append(panSolvedAtlas.textureNamed(textureName))
        }
        return panSolvedTexture
    }
    
    var zzAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "zz")
    }
    
    var zzTexture: [SKTexture] {
        return [
            zzAtlas.textureNamed("ZZ1"),
            zzAtlas.textureNamed("ZZ2"),
        ]
    }
    
    var donnaAtlas : SKTextureAtlas {
        return SKTextureAtlas(named: "donna")
    }
    
    var donnaMovementTexture : [SKTexture] {
        return [
            donnaAtlas.textureNamed("walk1"),
            donnaAtlas.textureNamed("walk2"),
            donnaAtlas.textureNamed("walk3"),
            donnaAtlas.textureNamed("walk4")
        ]
    }
    
    var donnaLampAtlas : SKTextureAtlas {
        return SKTextureAtlas(named: "donnaLamp")
    }
    
    var donnaLampTexture : [SKTexture] {
        return [
            donnaLampAtlas.textureNamed("donnaLamp1"),
            donnaLampAtlas.textureNamed("donnaLamp2")
        ]
    }
    
    var doorObstacleAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "doorObstacle")
    }
    
    var doorObstacleTexture: [SKTexture] {
        var doorObstacleTexture : [SKTexture] = []
        for i in 1...doorObstacleAtlas.textureNames.count {
            let textureName = "doorObstacle\(i)"
            doorObstacleTexture.append(doorObstacleAtlas.textureNamed(textureName))
        }
        return doorObstacleTexture
    }
}

