//
//  StartView.swift
//  Miau Little Helper
//
//  Created by rsbj on 05/04/23.
//

import SwiftUI

struct StartView: View {
    @AppStorage("pause") var pause: Bool = false
    @AppStorage("volumeMusic") var volumeMusic: Double = 1.0
    @AppStorage("volumeEffects") var volumeEffects: Double = 1.0

    var body: some View {
        if #available(iOS 16.0, *) {
            // if IPad has the current version updated
            GeometryReader{
                geo in
                NavigationStack{
                    // Faz aqui dentro oq vai aparecer na tela
                    ZStack{
                        Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .ignoresSafeArea()
                            .frame(height: geo.size.height)
                        Color(.black)
                            .ignoresSafeArea()
                            .opacity(0.5)
                        VStack{
                            Text("Miau Little Helper")
                                .font(.custom("Pixhobo", size: geo.size.width/18))
                                .foregroundColor(.white)
                            
                            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                                ZStack {
                                    Image("buttonBgWide")
                                        .resizable()
                                    Text("Jogar")
                                        .font(.custom("Greybeard22pxBold", size: geo.size.width/16))
                                        .minimumScaleFactor(0.01)
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: geo.size.width/2.7, height: geo.size.height/7)
                            
                            HStack {
                                NavigationLink(destination: HelpView().navigationBarBackButtonHidden(true)) {
                                    ZStack {
                                        Image("buttonBg")
                                            .resizable()
                                        Text("?")
                                            .font(.custom("Greybeard22pxBold", size: geo.size.width/25))
                                            .foregroundColor(.white)
                                            .minimumScaleFactor(0.01)
                                    }
                                }
                                .frame(width: geo.size.width/14, height: geo.size.height/10)
                                
                                NavigationLink(destination: CreditsView().navigationBarBackButtonHidden(true)) {
                                    ZStack {
                                        Image("buttonBgWide")
                                            .resizable()
                                        Text("Creditos")
                                            .font(.custom("Greybeard22pxBold", size: geo.size.width/25))
                                            .foregroundColor(.white)
                                            .minimumScaleFactor(0.01)
                                    }
                                }
                                .frame(width: geo.size.width/4.6, height: geo.size.height/10)
                                
                                
                                NavigationLink(destination: SettingsView().navigationBarBackButtonHidden(true)) {
                                    ZStack {
                                        Image("buttonBg")
                                            .resizable()
                                        Image("settings")
                                            .resizable()
                                            .frame(width: geo.size.width/28, height: geo.size.width/28)
                                    }
                                }
                                .isDetailLink(false)
                                .frame(width: geo.size.width/14, height: geo.size.height/10)
                                
                            }
                        }.padding(.bottom,geo.size.width/30)
                    }
                }
                .onAppear() {
                    pause = false
                }
            }
        }
        else {
            // Fallback on earlier versions
            Text("Hello")
        }
    }
    
//    init() {
//        for familyName in UIFont.familyNames {
//            print(familyName)
//
//            for fontName in UIFont.fontNames(forFamilyName: familyName){
//                print("-- \(fontName)")
//            }
//        }
//    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().previewInterfaceOrientation(.landscapeRight)
    }
}
