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
                        .padding(.top, geo.size.width/13)
                    Spacer()
                }
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
