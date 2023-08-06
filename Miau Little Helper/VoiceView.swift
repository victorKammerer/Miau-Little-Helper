//
//  HelpView.swift
//  Miau Little Helper
//
//  Created by rsbj on 05/04/23.
//

import SwiftUI

struct VoiceView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        GeometryReader{
            geo in
            ZStack{
                
                Image("backgroundHelp")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        Spacer()
                        Button (action: { presentation.wrappedValue.dismiss() } ){
                            ZStack {
                                Image("buttonBg")
                                    .resizable()
                                Text("X")
                                    .font(.custom("Greybeard22pxBold", size: geo.size.width/25))
                                    .foregroundColor(.white)
                                    .minimumScaleFactor(0.01)
                            }
                        }
                        .frame(width: geo.size.width/14, height: geo.size.height/10)
                        .padding(.trailing, geo.size.width/20)
                        .padding(.top, geo.size.width/20)
                    }
                    Spacer()
                }.ignoresSafeArea()
                
                VStack(spacing: geo.size.height/12) {
                    Text("A detecção de voz é uma parte essencial do Miau Little Helper, nosso jogo pode ser jogado através de comandos de voz. \nVocê pode interagir com a nina chamando por seu nome, assim que aparecer uma Exclamação em sua sua cabeça significa que ela vai fazer o que você pedir!")
                        .font(.custom("Greybeard22pxBold", size: geo.size.width/35))
                        .foregroundColor(.white)
                        .padding(.top, geo.size.width/90)
                        .multilineTextAlignment(.center)
                        .lineLimit(10000)
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                        ZStack {
                            Image("buttonBgWide")
                                .resizable()
                            Text("Continuar")
                                .font(.custom("Greybeard22pxBold", size: geo.size.width/26))
                                .minimumScaleFactor(0.01)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: geo.size.width/4, height: geo.size.height/8.5)
                }.padding(geo.size.width/8)
            }
        }
    }
}
