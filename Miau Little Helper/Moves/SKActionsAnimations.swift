//
//  SKActionsAnimations.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 02/04/23.
//

import SpriteKit

extension GameScene {
    
    var walk : SKAction {
        
        let textureAnimation = SKAction.animate(with: self.ninaMovementTexture, timePerFrame: 0.1)
        let walk = SKAction.repeatForever(textureAnimation)
        
        return walk
        
    }
    
    var left : SKAction {
        let left = SKAction.run {
            self.nina.xScale = -1.0
            self.nina.run(self.walk, withKey: "ninaMoveAnimation")
            self.nina.run(self.stepsAudio, withKey: "ninaStepAudio")
        }
        
        return left
    }
    
    var right : SKAction {
        let right = SKAction.run {
            self.nina.xScale = 1.0
            self.nina.run(self.walk, withKey: "ninaMoveAnimation")
            self.nina.run(self.stepsAudio, withKey: "ninaStepAudio")
        }
        
        return right
    }
    
    var stop : SKAction {
        let stop = SKAction.run {
            self.nina.removeAction(forKey: "ninaMoveAnimation")
            self.nina.removeAction(forKey: "ninaStepAudio")
            self.stepsSound1.run(SKAction.stop())
            self.stepsSound2.run(SKAction.stop())
//            self.nina.run(SKAction.stop())
            //jump animation?
        }
        
        return stop
    }
    
    var getReadyToJump: SKAction {
        return SKAction.sequence([
            SKAction.animate(with: ninaImpulseTexture, timePerFrame: 0.03),
            SKAction.run {
                self.jumpSound.run(SKAction.play())
            }
        ])
    }
    
    func goingDown(leftOrRight: String) -> SKAction {
        return SKAction.sequence([
            SKAction.setTexture(ninaJumpAtlas.textureNamed("jump7")),
            SKAction.wait(forDuration: 0.1),
            SKAction.setTexture(ninaJumpAtlas.textureNamed("jump8"))
        ])
    }
    
    var getOnGround: SKAction {
        return SKAction.sequence([
            
            SKAction.animate(with: ninaLandingTexture, timePerFrame: 0.05),
            SKAction.setTexture(ninaAtlas.textureNamed("nina1"))
        ])
    }
    
    var sleeping: SKAction {
        return SKAction.animate(with: ninaSleepingTexture, timePerFrame: 0.2)
    }
    
    var wakingUp: SKAction {
        return SKAction.animate(with: ninaWakingTexture, timePerFrame: 0.1)
    }
    
    var interact: SKAction {
        return SKAction.sequence([
            SKAction.animate(with: ninaInteractTexture, timePerFrame: 0.1),
            SKAction.run {
                self.interationSound.run(SKAction.play())
                self.nina.texture = SKTexture(imageNamed: "nina1")
            }
        ])
    }
    
    var panAnimation: SKAction {
        let pan = SKAction.animate(with: panTexture, timePerFrame: 0.1)
        self.pan.texture!.filteringMode = SKTextureFilteringMode.nearest
        return SKAction.repeatForever(pan)
    }
    
    var panSolved: SKAction {
        let panSolved = SKAction.animate(with: panSolvedTexture, timePerFrame: 0.1)
        return SKAction.repeatForever(panSolved)
    }
    
    var zzAnimation: SKAction {
        let zzAnimation = SKAction.animate(with: zzTexture, timePerFrame: 0.5)
        self.zz.texture!.filteringMode = SKTextureFilteringMode.nearest
        return SKAction.repeatForever(zzAnimation)
    }
    
    var doorObstacleAnimation: SKAction {
        return SKAction.animate(with: doorObstacleTexture, timePerFrame: 0.1)
    }
    
    var donnaLampAnimation: SKAction {
        let donnaLampAnimation = SKAction.animate(with: donnaLampTexture, timePerFrame: 1)
        return SKAction.repeatForever(donnaLampAnimation)
    }
    
    var eletricityAnimation: SKAction {
        let eletricityAnimation = SKAction.animate(with: eletricityTexture, timePerFrame: 0.5)
        return SKAction.repeatForever(eletricityAnimation)
    }
}
