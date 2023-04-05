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
            NavigationStack{
                // Faz aqui dentro oq vai aparecer na tela
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
