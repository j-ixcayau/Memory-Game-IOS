//
//  BaseScreen.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 5/04/23.
//

import SwiftUI

struct BaseScreen<Content> : View where Content : View {
    @ViewBuilder let child: () -> Content
    
    var body: some View {
        ScrollView{
            VStack(
                content: child
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color("BackgroundColor"))
    }
}
