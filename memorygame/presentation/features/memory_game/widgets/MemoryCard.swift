//
//  MemoryCard.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 5/04/23.
//

import SwiftUI

struct MemoryCard: View {
    @State private var flipped: Bool = false
    
    let value: String
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text(value)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .opacity(flipped ? 1 : 0)
        }
        .frame(width: 100, height: 100)
        .overlay(
            RoundedRectangle(
                cornerRadius: 16
            )
            .stroke(
                .blue,
                lineWidth: 4
            )
        )
        .rotation3DEffect(.degrees(flipped ? 0: 180), axis: (x: 1, y: 1, z: 0))
        .onTapGesture {
            withAnimation(.spring()){
                flipped.toggle()
            }
        }
        .padding()
    }
}

struct MemoryCard_Previews: PreviewProvider {
    static var previews: some View {
        MemoryCard(
            value: "Non text"
        )
    }
}
