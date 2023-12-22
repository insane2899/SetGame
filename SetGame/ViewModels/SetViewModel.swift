//
//  SetViewModel.swift
//  SetGame
//
//  Created by Soumik Sen on 20/12/23.
//

import Foundation
import SwiftUI

class SetViewModel: ObservableObject {
    
    typealias Card = SetModel.Card
    
    @Published var gameModel: SetModel
    
    init() {
        gameModel = SetModel()
    }

    // MARK: - Exposed Model Vars
    var displayedCards: [Card] {
        return gameModel.displayedCards
    }

    var matched: Bool {
        return gameModel.matched
    }

    // MARK: - Intents
}
