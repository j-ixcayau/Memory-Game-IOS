//
//  CommonBackground.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 27/04/23.
//

import SwiftUI

struct CommonBackground: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            content
        }
    }
}


extension View {
    func commonBackground() -> some View {
        modifier(CommonBackground())
    }
}
