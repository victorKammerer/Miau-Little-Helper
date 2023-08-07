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
    @AppStorage("showCredit") var showCredit: Bool = false
    @AppStorage("recording") var recording: Bool = false
    
    @State private var record = false
    var font = UIFont()
    var fontTitle = UIFont()
    
    var body: some View {
        GeometryReader{
            geo in
            ZStack{
                NavigationLink("", destination: CreditsView().navigationBarBackButtonHidden(true),isActive: $showCredit)
                SpriteView(scene: scene)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Spacer()
                        ZStack{
                            NavigationLink(destination: PauseView().navigationBarBackButtonHidden(true)) {
                                ZStack {
                                    Image("buttonBg")
                                        .resizable()
                                    Image("pause")
                                        .resizable()
                                        .frame(width: geo.size.width/28, height: geo.size.width/28)
                                }
                            }
                            .frame(width: geo.size.width/14, height: geo.size.height/10)
                            .padding(.trailing, geo.size.width/40)
                            .padding(.top, geo.size.width/40)
                        }
                        
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        ZStack{
                            Button("aaaaaaa", action: {
                                if recording == false {
                                    record.toggle()
                                    
                                    recording = true
                                    
                                    VoiceRecognizer().startSpeechRecognization()
                                } else {
                                    record.toggle()
                                    
                                    recording = false
                                    
                                    VoiceRecognizer().cancelSpeechRecognization()
                                }
                            })
//                            Image("recordingButton")
                        }
                    }
                }
            }
        }
    }
    
    init() {
        let cfURL = Bundle.main.url(forResource: "Greybeard-22px-Bold", withExtension: "ttf")! as CFURL
        let phURL = Bundle.main.url(forResource: "pixhobo", withExtension: "otf")! as CFURL
        
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        CTFontManagerRegisterFontsForURL(phURL, CTFontManagerScope.process, nil)
        
        font = UIFont(name: "Greybeard22pxBold", size: 40)!
        fontTitle = UIFont(name: "pixhobo", size: 60)!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
