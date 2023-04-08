//
//  PauseView.swift
//  Miau Little Helper
//
//  Created by rsbj on 05/04/23.
//

import SwiftUI

struct PauseView: View {
    
    @AppStorage("pause") var pause: Bool = false
    @AppStorage("volumeMusic") var volumeMusic: Double = 1.0
    @AppStorage("volumeEffects") var volumeEffects: Double = 1.0
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        GeometryReader{
            geo in
            ZStack {
                Image("backgroundSettings")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    
                    Text("Musica")
                        .foregroundColor(.white)
                        .font(.custom("Greybeard22pxBold", size: geo.size.width/22))
                        .multilineTextAlignment(.leading)
                        .padding(.bottom,-geo.size.width/160)
                    UISliderView(value: $volumeMusic,
                                 minValue: 0.0,
                                 maxValue: 1.0,
                                 thumbColor: .white,
                                 minTrackColor: UIColor(named: "greenMLH")!,
                                 maxTrackColor: UIColor(named: "darkGreenMLH")!)
                        .padding(.bottom,geo.size.width/30)
                    
                    
                    Text("Efeitos")
                        .foregroundColor(.white)
                        .font(.custom("Greybeard22pxBold", size: geo.size.width/22))
                        .multilineTextAlignment(.leading)
                        .padding(.bottom,-geo.size.width/160)
                    UISliderView(value: $volumeEffects,
                                 minValue: 0.0,
                                 maxValue: 1.0,
                                 thumbColor: .white,
                                 minTrackColor: UIColor(named: "greenMLH")!,
                                 maxTrackColor: UIColor(named: "darkGreenMLH")!)
                        .padding(.bottom,geo.size.width/20)
                    
                    
                    Button (action: {
                        presentation.wrappedValue.dismiss()
                        pause = false
                    }) {
                        ZStack {
                            Image("buttonBgWide")
                                .resizable()
                            Text("Voltar")
                                .font(.custom("Greybeard22pxBold", size: geo.size.width/22))
                                .minimumScaleFactor(0.01)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: geo.size.width/2.7, height: geo.size.height/7)
                    
                    Button (action: {
                        NavigationUtil.popToRootView()
                        pause = false
                    }) {
                        ZStack {
                            Image("buttonBgWide")
                                .resizable()
                            Text("Sair do Jogo")
                                .font(.custom("Greybeard22pxBold", size: geo.size.width/22))
                                .minimumScaleFactor(0.01)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: geo.size.width/2.7, height: geo.size.height/7)
                    
                }.padding(.leading,geo.size.width/3.2)
                    .padding(.trailing,geo.size.width/3.2)
            }
        }
        .onAppear() {
            pause = true
        }
    }
}

struct PauseView_Previews: PreviewProvider {
    static var previews: some View {
        PauseView().previewInterfaceOrientation(.landscapeRight)
    }
}
