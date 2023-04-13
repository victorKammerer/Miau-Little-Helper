//
//  CreditsView.swift
//  Miau Little Helper
//
//  Created by rsbj on 05/04/23.
//

import SwiftUI

struct CreditsView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        GeometryReader{
            geo in
            ZStack{
                
                Image("backgroundHelp")
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack {
                        Text("Creditos")
                            .font(.custom("Greybeard22pxBold", size: geo.size.width/16))
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.01)
                        Text("App desenvolvido para o challenge inPada na Apple Developers Academy | UFPE 2023\n\nEquipe:\nJoão Pedro Moreira\nGiovanna Paz\nRaphael Prestes\nRinaldo da Silva\n Victor Kammerer")
                            .font(.custom("Greybeard22pxBold", size: geo.size.width/30))
                            .foregroundColor(.white)
                            .padding(.top, geo.size.width/1000)
                            .lineLimit(10000)
                            .multilineTextAlignment(.center)
                        Text("  ”Esse aplicativo foi uma junção de paixões e objetivos de aprendizado a fim de criar uma experiência divertida que promovesse acessibilidade com muita personalidade, ninguem soltou a mão de ninguem e a história foi concluida, quem sabe a Donna não volta a aprontar novamente e claro a Nina também pra salva-la de si mesmo, até logo.”")
                            .font(.custom("Greybeard22pxBold", size: geo.size.width/30))
                            .foregroundColor(.white)
                            .padding(.top, geo.size.width/90)
                            .lineLimit(10000)
                            .multilineTextAlignment(.leading)
                        HStack{
                            Spacer()
                            Text("- Desenvolvedores")
                                .font(.custom("Greybeard22pxBold", size: geo.size.width/30))
                                .foregroundColor(.white)
                                .lineLimit(10000)
                        }
                        
                        Text("  Os maiores créditos vão para nossa maior inspiração a Nina")
                            .font(.custom("Greybeard22pxBold", size: geo.size.width/30))
                            .foregroundColor(.white)
                            .padding(.top, geo.size.width/90)
                            .lineLimit(10000)
                            .multilineTextAlignment(.leading)
                        Image("ninaReal")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(50)
                            .shadow(radius: 10)
                        Text("  Somos responsáveis por ter uma abordagem honesta sobre nossos produtos, sem exageros ou promesas vazias, tratando com respeito os nossos usuários. \n  Nós mostraremos ao mundo um jogo onde o principal controle é por voz, criando uma possibilidade ampla para a interação em nosso jogo, e o personagem principal é um gatinho fofinho.\n\nTrilha Sonora: Helton Paz")
                            .font(.custom("Greybeard22pxBold", size: geo.size.width/30))
                            .foregroundColor(.white)
                            .padding(.top, geo.size.width/90)
                            .lineLimit(10000)
                        Image("jump1")
                            .resizable()
                            .frame(width: geo.size.width/2.5, height:
                                    geo.size.width/3)
                            .scaledToFit()
                    }.padding(geo.size.width/13.5)
                        .clipped()
                }.frame(width: 1200, height: 800)
                
                VStack{
                    HStack{
                        Spacer()
                        Button (action: { NavigationUtil.popToRootView() } ){
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
            }
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
