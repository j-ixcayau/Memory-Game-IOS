//
//  detectOrientation.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 7/04/23.
//

import SwiftUI

struct DetectOrientation: ViewModifier {
    @Binding var orientation: UIDeviceOrientation
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                orientation = UIDevice.current.orientation
            }
    }
}

extension View {
    func detectOrientation(_ orientation: Binding<UIDeviceOrientation>) -> some View {
        modifier(DetectOrientation(orientation: orientation))
    }
}
