//
//  ContentView.swift
//  Miau Little Helper
//
//  Created by vko on 20/03/23.
//

import SwiftUI
import SpriteKit

var scene: SKScene {
    let scene = GameScene()
    scene.size = CGSize(width: 4000, height: 3000)
    scene.scaleMode = .aspectFill //or .aspectFill
    return scene
}


struct ContentView: View {
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
