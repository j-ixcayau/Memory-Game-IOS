//
//  OnViewTap.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 17/04/23.
//

import SwiftUI

struct OnViewTap<Content> : View where Content : View {
    @ViewBuilder let child: () -> Content
    let onTap: () -> Void
    
    @GestureState private var dragState = DragState.inactive
    
    private let cornerRadius: CGFloat = 16
    private let lineWidth: CGFloat = 4
    private let animation: Animation = .spring()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(dragState.isDragging ? Color.blue.opacity(0.7) : Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.blue, lineWidth: lineWidth)
                )
            
            child()
        }
        .padding()
        .simultaneousGesture(
            DragGesture(minimumDistance: 0.0)
                .updating($dragState) { value, state, _ in
                    state = DragState(location: value.location, isDragging: true)
                }
                .onEnded { value in
                    let endLocation = value.location
                    let bounds = UIScreen.main.bounds
                    let containsEndLocation = bounds.contains(endLocation)
                    if containsEndLocation {
                        onTap()
                    }
                }
        )
        .animation(animation, value: dragState.isDragging)
    }
}

struct OnViewTap_Previews: PreviewProvider {
    static var previews: some View {
        OnViewTap(
            child: {
                Text("Sample")
            },
            onTap: {
                
            }
        )
    }
}

struct DragState {
    var location: CGPoint
    var isDragging: Bool
    
    static let inactive = DragState(location: .zero, isDragging: false)
}
