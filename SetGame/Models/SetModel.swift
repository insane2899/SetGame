//
//  SetModel.swift
//  SetGame
//
//  Created by Soumik Sen on 20/12/23.
//

/*
 Assumption is that if 2 cards are selected then there is one and only one card that can create a set
 */
import Foundation

struct SetModel {
    
    typealias CardShape = Card.CardShape
    typealias CardCount = Card.CardCount
    typealias CardShade = Card.CardShade
    typealias CardColor = Card.CardColor
    
    private(set) var deckCards: [Card]
    private(set) var displayedCards: [Card]
    private(set) var selectedCards: [Card]

    init() {
        displayedCards = []
        selectedCards = []
        deckCards = []
        // FIXME: Find a more efficient way to initialize the deckCards var
        for shape in CardShape.allCases {
            for count in CardCount.allCases {
                for shade in CardShade.allCases {
                    for color in CardColor.allCases {
                        deckCards.append(Card(shape: shape, count: count, shade: shade, color: color))
                    }
                }
            }
        }
    }
    
    var matched: Bool {
        if selectedCards.count == 3,
           selectedCards[2] == thirdCard! { // FIXME: Used forced unwrap to test. Must change it to some concrete solution that won't cause crash later
            return true
        }
        return false
    }
    
    var thirdCard: Card? {
        if selectedCards.count != 2 {
            return nil
        }
        return createSetCard(using: selectedCards[0], and: selectedCards[1])
    }

    func createSetCard(using card1: Card, and card2: Card) -> Card {
        var reqShape: CardShape?
        var reqCount: CardCount?
        var reqShade: CardShade?
        var reqColor: CardColor?
        if card1.shape == card2.shape {
            reqShape = card1.shape
        } else {
            reqShape = CardShape.allCases.filter( { $0 != card1.shape && $0 != card2.shape }).first
        }
        if card1.count == card2.count {
            reqCount = card1.count
        } else {
            reqCount = CardCount.allCases.filter( { $0 != card1.count && $0 != card2.count }).first
        }
        if card1.shade == card2.shade {
            reqShade = card1.shade
        } else {
            reqShade = CardShade.allCases.filter( { $0 != card1.shade && $0 != card2.shade }).first
        }
        if card1.color == card2.color {
            reqColor = card1.color
        } else {
            reqColor = CardColor.allCases.filter( { $0 != card1.color && $0 != card2.color }).first
        }
        // FIXME: Used forced unwrap to test. Must change it to some concrete solution that won't cause crash later
        return Card(shape: reqShape!, count: reqCount!, shade: reqShade!, color: reqColor!)
    }
}
