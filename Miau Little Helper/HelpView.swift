//
//  HelpView.swift
//  Miau Little Helper
//
//  Created by rsbj on 05/04/23.
//

import SwiftUI

struct HelpView: View {
    
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
                
                VStack {
                    Text("Ajuda")
                        .font(.custom("Greybeard22pxBold", size: geo.size.width/16))
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.01)
                    Text("Miau Little Helper é um jogo point-and-click estrelando Nina, a gatinha que tem que ajudar Donna em atividades ao redor da casa. Donna é muito atrapalhada e Nina está sempre andando pela casa garantindo que está tudo nos conformes.\nO jogador deve ajudar Nina a arrumar o que está fora de ordem. Para isso há duas formas de controle principais: tocar na tela onde há o problema e Nina irá até lá ou usando o controle de voz. É só liberar o acesso ao microfone e falar “Nina, …” e completar com o objeto que Nina deve inspecionar.")
                        .font(.custom("Greybeard22pxBold", size: geo.size.width/35))
                        .foregroundColor(.white)
                        .padding(.top, geo.size.width/90)
                        .multilineTextAlignment(.center)
                        .lineLimit(10000)
                }.padding(geo.size.width/8)
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
