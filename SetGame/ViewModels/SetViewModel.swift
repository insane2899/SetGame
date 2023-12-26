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
    
    @Published private var gameModel: SetModel
    
    init() {
        gameModel = SetModel()
    }

    // MARK: - Exposed Model Vars
    var displayedCards: [Card] {
        return gameModel.displayedCards
    }

    var isMatched: Bool {
        return gameModel.matched
    }
    
    var deckCards: [Card] {
        return gameModel.deckCards
    }

    func getColor(_ color: Card.CardColor) -> Color {
        switch color {
        case .red:
            return .red
        case .green:
            return .green
        case .purple:
            return .purple
        }
    }

    // MARK: - Intents

    func selectCard(_ card: Card) {
        gameModel.selectCard(card)
    }

    func cardIsSelected(_ card: Card) -> Bool {
        gameModel.cardIsSelected(card)
    }

    func dealACard() {
        gameModel.dealACard()
    }
}
