//
//  MemoryGamePage.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 5/04/23.
//

import SwiftUI

struct MemoryGamePage: View {
    @ObservedObject var memoryGameBloc : MemoryGameBloc
    
    @State private var orientation = UIDevice.current.orientation
    @State private var columnsCount = 3;
    @State private var gridColumns : [GridItem] = []
    
    init(difficultyLevel: DifficultyLevel) {
        self.memoryGameBloc = MemoryGameBloc(difficultyLevel: difficultyLevel)
    }
    
    var body: some View {
        BaseScreen(
            navigationTitle: "Level: \(memoryGameBloc.difficultyLevel)",
            child: {
                Text("Resolve the items")
                
                LazyVGrid(
                    columns: gridColumns,
                    spacing: 0
                ){
                    ForEach(memoryGameBloc.words.indices, id: \.self) { index in
                        MemoryCard(
                            guessWord: memoryGameBloc.words[index],
                            onTap: {
                                memoryGameBloc.onCardTap(index: index)
                            }
                        )
                    }
                }
            }
        )
        .detectOrientation($orientation) {
            updateChanges()
        }
        .onAppear{
            orientation = UIDevice.current.orientation
            updateChanges()
        }
    }
    
    func updateChanges() {
        self.gridColumns = orientation.isLandscape
        ? [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        : [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        
        columnsCount = self.gridColumns.count
    }
}

struct MemoryGamePage_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGamePage(difficultyLevel: .Medium)
    }
}
