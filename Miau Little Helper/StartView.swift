//
//  StartView.swift
//  Miau Little Helper
//
//  Created by rsbj on 05/04/23.
//

import SwiftUI

struct StartView: View {
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
                        VStack{
                            ZStack{
//                                Text("Miau Little Helper")
//                                    .font(.custom("Pixhobo", size: geo.size.width/16.8))
//                                    .foregroundColor(.black)
                                
                                Text("Miau Little Helper")
                                    .font(.custom("Pixhobo", size: geo.size.width/18))
                                    .foregroundColor(.white)
                                
                            }
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
                                
                                
                                NavigationLink(destination: ConfigurationView().navigationBarBackButtonHidden(true)) {
                                    ZStack {
                                        Image("buttonBg")
                                            .resizable()
                                        Image("settings")
                                            .resizable()
                                            .frame(width: geo.size.width/28, height: geo.size.width/28)
                                    }
                                }
                                .frame(width: geo.size.width/14, height: geo.size.height/10)

                            }
                        }.padding(.bottom,geo.size.width/30)
                    }
                }
            }
        }
        else {
            // Fallback on earlier versions
            NavigationView{
                // Copia aqui dentro oq vai aparecer na tela (mesma coisa que tem dentro do NavigationStack)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
    init() {
        for familyName in UIFont.familyNames {
            print(familyName)

            for fontName in UIFont.fontNames(forFamilyName: familyName){
                print("-- \(fontName)")
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().previewInterfaceOrientation(.landscapeRight)
    }
}
