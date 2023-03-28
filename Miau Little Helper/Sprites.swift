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
}

