//
//  BaseScreen.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 5/04/23.
//

import SwiftUI

struct BaseScreen<Content> : View where Content : View {
    let navigationTitle: String
    @ViewBuilder let child: () -> Content
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(
                    content: child
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color("BackgroundColor"))
            .navigationTitle(navigationTitle)
        }
    }
}
