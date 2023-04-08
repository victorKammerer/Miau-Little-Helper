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
        GeometryReader{
            geo in
            ZStack{
                SpriteView(scene: scene)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Spacer()
                        NavigationLink(destination: PauseView().navigationBarBackButtonHidden(true)) {
                            ZStack {
                                Image("buttonBg")
                                    .resizable()
                                Image("settings")
                                    .resizable()
                                    .frame(width: geo.size.width/28, height: geo.size.width/28)
                            }
                        }
                        .frame(width: geo.size.width/14, height: geo.size.height/10)
                        .padding(.trailing, geo.size.width/40)
                        .padding(.top, geo.size.width/40)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
