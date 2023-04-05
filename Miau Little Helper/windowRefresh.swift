//
//  apiRefresh.swift
//  Miau Little Helper
//
//  Created by vko on 05/04/23.
//

import SpriteKit

extension GameScene {
    
    func windowRefresh() {
        test = SKLabelNode(text: "\(viewModel?.weatherDescription ?? "hehe")")
        
        print(viewModel?.weatherDescription ?? "hehe")
        
        test.position = CGPoint(x: 1000, y: 800)
        test.fontSize = CGFloat(1000)
        test.fontColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        
        addChild(test)
    }
}
