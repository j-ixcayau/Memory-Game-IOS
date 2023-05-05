//
//  RootPage.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 20/04/23.
//

import SwiftUI

struct RootPage: View {
    
    @ObservedObject var rootBloc: RootBloc = RootBloc()
    
    var body: some View {
        VStack {
            if rootBloc.isLoginNavigationActive {
                LoginPage()
            } else if  rootBloc.isHomeNavigationActive {
                LevelChoosePage()
            } else {
                LoadingView()
            }
        }
        .onAppear{
            rootBloc.checkUserLogged()
        }
    }
}

struct RootPage_Previews: PreviewProvider {
    static var previews: some View {
        RootPage()
    }
}
