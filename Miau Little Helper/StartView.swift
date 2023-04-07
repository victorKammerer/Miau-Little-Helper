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
                                Text("Miau Little Helper")
                                    .font(.custom("Greybeard22pxBold", size: geo.size.width/14.7))
                                    .foregroundColor(.black)
                                
                                Text("Miau Little Helper")
                                    .font(.custom("Greybeard22pxBold", size: geo.size.width/15))
                                    .foregroundColor(.white)
                                
                            }
                            
                            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                                Text("Jogar")
                                    .font(.custom("Greybeard22pxBold", size: geo.size.width/20))
                                    .minimumScaleFactor(0.01)
                                    .foregroundColor(.white)
                            }
                            .frame(width: geo.size.width/3, height: geo.size.height/7)
                            .background(.blue)
                            .cornerRadius(12)
                            .padding(10)
                            
                            HStack {
                                NavigationLink(destination: HelpView().navigationBarBackButtonHidden(true)) {
                                    Text("?")
                                        .font(.custom("Greybeard22pxBold", size: geo.size.width/25))
                                        .foregroundColor(.white)
                                        .minimumScaleFactor(0.01)
                                }
                                .frame(width: geo.size.width/14, height: geo.size.height/10)
                                .background(.blue)
                                .cornerRadius(12)
                                
                                NavigationLink(destination: CreditsView().navigationBarBackButtonHidden(true)) {
                                    Text("Creditos")
                                        .font(.custom("Greybeard22pxBold", size: geo.size.width/30))
                                        .foregroundColor(.white)
                                        .minimumScaleFactor(0.01)
                                }
                                .frame(width: geo.size.width/6, height: geo.size.height/10)
                                .background(.blue)
                                .cornerRadius(12)
                                .padding(10)
                                
                                
                                NavigationLink(destination: ConfigurationView().navigationBarBackButtonHidden(true)) {
                                    Text("X")
                                        .font(.custom("Greybeard22pxBold", size: geo.size.width/25))
                                        .foregroundColor(.white)
                                        .minimumScaleFactor(0.01)
                                }
                                .frame(width: geo.size.width/14, height: geo.size.height/10)
                                .background(.blue)
                                .cornerRadius(12)
                            }
                        }
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
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().previewInterfaceOrientation(.landscapeRight)
    }
}
