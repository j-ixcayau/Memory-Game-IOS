//
//  MemoryGamePage.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 5/04/23.
//

import SwiftUI

struct MemoryGamePage: View {
    
    let gameLevel = "Begginer"
    
    let gridWay = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        BaseScreen(
            navigationTitle: "Level: \(gameLevel)",
            child: {
                Text("Resolve the items")
                
                LazyVGrid(
                    columns: gridWay,
                    spacing: 8
                ){
                    MemoryCard(
                        value: "Hola"
                    )
                    MemoryCard(
                        value: "No"
                    )
                    MemoryCard(
                        value: "Hola"
                    )
                    MemoryCard(
                        value: "Jony"
                    )
                    MemoryCard(
                        value: "Jony"
                    )
                    MemoryCard(
                        value: "No"
                    )
                }
            }
        )
    }
}

struct MemoryGamePage_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGamePage()
            .preferredColorScheme(.dark)
    }
}
