//
//  MemoryGamePage.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 5/04/23.
//

import SwiftUI

struct MemoryGamePage: View {
    @ObservedObject private var memoryGameBloc : MemoryGameBloc
    
    @State private var orientation = UIDevice.current.orientation
    @State private var columnsCount = 3;
    @State private var gridColumns : [GridItem] = []
    
    @Environment(\.presentationMode) var presentation
    
    init(difficultyLevel: DifficultyLevel) {
        let currentDate = Date.now
        self.memoryGameBloc = MemoryGameBloc(difficultyLevel: difficultyLevel, currentDate: currentDate)
    }
    
    var body: some View {
        BaseScreen(
            child: {
                Text("Resolve the items\nWrong attempts: \(memoryGameBloc.attempErrorsCounter)")
                
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
                .navigationTitle("Level: \(memoryGameBloc.difficultyLevel.description)")
            }
        )
        .alert(isPresented: $memoryGameBloc.showAlert) {
            switch memoryGameBloc.showAlertType {
            case .gameWon:
                return Alert(
                    title: Text("Game Won!"),
                    message: Text("You have successfully won the game, congrats!!!"),
                    dismissButton: Alert.Button.default(
                        Text("Ok"),
                        action: {
                            presentation.wrappedValue.dismiss()
                        }
                    )
                )
            }
        }
        .detectOrientation($orientation) {
            updateChanges()
        }
        .onAppear {
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
        MemoryGamePage(difficultyLevel: .Easy)
    }
}
