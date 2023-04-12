//
//  detectOrientation.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 7/04/23.
//

import SwiftUI

struct DetectOrientation: ViewModifier {
    @Binding var orientation: UIDeviceOrientation
    let onTap: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                orientation = UIDevice.current.orientation
                onTap?()
            }
    }
}

extension View {
    func detectOrientation(
        _ orientation: Binding<UIDeviceOrientation>,
        _ onTap: @escaping () -> Void
    ) -> some View {
        modifier(
            DetectOrientation(
                orientation: orientation,
                onTap: onTap
            )
        )
    }
}
