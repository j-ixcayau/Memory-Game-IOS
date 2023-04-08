//
//  MemoryGamePage.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 5/04/23.
//

import SwiftUI

struct MemoryGamePage: View {
    
    let dificultyLevel: DifficultyLevel
    
    @State private var orientation = UIDevice.current.orientation
    @State private var columnsCount = 3;
    @State private var words : [GuessWord] = []
    @State private var gridColumns : [GridItem] = []
    
    init(dificultyLevel: DifficultyLevel) {
        self.dificultyLevel = dificultyLevel
        
    }
    
    var body: some View {
        BaseScreen(
            navigationTitle: "Level: \(dificultyLevel)",
            child: {
                Text("Resolve the items")
                
                if !gridColumns.isEmpty {
                    LazyVGrid(
                        columns: gridColumns,
                        spacing: 0
                    ){
                        ForEach(words.dropLast(words.count % columnsCount)) { word in
                            MemoryCard(value: word.word)
                        }
                    }
                    
                    LazyHStack {
                        ForEach(words.suffix(words.count % columnsCount)) { word in
                            MemoryCard(value: word.word)
                        }
                    }
                }
            }
        )
        .onAppear{
            orientation = UIDevice.current.orientation
            self.words = WordsList().getListShuffled(dificultyLevel:dificultyLevel)
            
            updateChanges()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            orientation = UIDevice.current.orientation
            
            updateChanges()
        }
    }
    
    
    
    func updateChanges() {
        var tempColumns: [GridItem]
        
        if orientation.isLandscape {
            tempColumns =  [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
            ]
        } else {
            tempColumns =  [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
            ]
        }
        
        columnsCount = tempColumns.count
        self.gridColumns = tempColumns
        
        print("New Columns \(columnsCount), New Grids \(self.gridColumns.count)")
    }
}

struct MemoryGamePage_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGamePage(dificultyLevel: .Medium)
    }
}
