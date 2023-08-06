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
    @AppStorage("showCredit") var showCredit: Bool = false
    @AppStorage("aceptedVoice") var aceptedVoice: Bool = false
    
    var font = UIFont()
    var fontTitle = UIFont()
    
    var body: some View {
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
                        Spacer()
                        
                        ZStack {
                            VStack{
                                Spacer().frame(height: geo.size.width/85)
                                HStack {
                                    Text("Miau")
                                        .font(.custom("pixhobo", size: geo.size.width/17))
                                        .foregroundColor(Color("darkGreenMLH"))
                                    Spacer().frame(width: geo.size.width/40)
                                    Text("Little")
                                        .font(.custom("pixhobo", size: geo.size.width/17))
                                        .foregroundColor(Color("darkGreenMLH"))
                                    Spacer().frame(width: geo.size.width/35)
                                    Text("Helper")
                                        .font(.custom("pixhobo", size: geo.size.width/17))
                                        .foregroundColor(Color("darkGreenMLH"))
                                }
                            }
                            Text("Miau Little Helper")
                                .font(.custom("pixhobo", size: geo.size.width/18))
                                .foregroundColor(Color("brightGreenMLH"))
                        }
                        if aceptedVoice {
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
                        }
                        else {
                            NavigationLink(destination: VoiceView().navigationBarBackButtonHidden(true)) {
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
                        }
                        
                        HStack {
                            NavigationLink(destination: HelpView().navigationBarBackButtonHidden(true)) {
                                ZStack {
                                    Image("buttonBgMedium")
                                        .resizable()
                                    Text("?")
                                        .font(.custom("Greybeard22pxBold", size: geo.size.width/25))
                                        .foregroundColor(.white)
                                        .minimumScaleFactor(0.01)
                                }
                            }
                            .frame(width: geo.size.width/5.5, height: geo.size.height/10)
                            
                            
                            NavigationLink(destination: SettingsView().navigationBarBackButtonHidden(true)) {
                                ZStack {
                                    Image("buttonBgMedium")
                                        .resizable()
                                    Image("settings")
                                        .resizable()
                                        .frame(width: geo.size.width/28, height: geo.size.width/28)
                                }
                            }
                            .isDetailLink(false)
                            .frame(width: geo.size.width/5.5, height: geo.size.height/10)
                        }
                        Spacer().frame(height: geo.size.height/6)
                        NavigationLink(destination: CreditsView().navigationBarBackButtonHidden(true)) {
                            Image("ratoMorto")
                                .resizable()
                                .scaledToFit()
                                .opacity(0.9)
                        }
                        .frame(height: geo.size.height/24)
                        
                    }.padding(.bottom,geo.size.width/30)
                }
            }
            .onAppear() {
                pause = false
                showCredit = false
            }
        }
    }
    
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().previewInterfaceOrientation(.landscapeRight)
    }
}
