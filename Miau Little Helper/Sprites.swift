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
}

