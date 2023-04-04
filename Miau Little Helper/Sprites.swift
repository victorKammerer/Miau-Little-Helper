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
}

