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

    init(initialCardCount: Int = 12) {
        displayedCards = []
        selectedCards = []
        deckCards = []
        // FIXME: Find a more efficient way to initialize the deckCards var
        for shape in CardShape.allCases {
            for count in CardCount.allCases {
                for shade in CardShade.allCases {
                    for color in CardColor.allCases {
                        deckCards.append(Card(id: hashCard(shape, count, shade, color),
                                              shape: shape,
                                              count: count,
                                              shade: shade,
                                              color: color))
                    }
                }
            }
        }
//        deckCards.shuffle() //FIXME: - Commented for now to test
        var index = 0
        while(deckCards.count > 0 && index < initialCardCount) {
            displayedCards.append(deckCards.removeFirst())
            index += 1
        }
    }
    
    var matched: Bool {
        if selectedCards.count == 3 {
            var shapeSet = Set<CardShape>()
            var countSet = Set<CardCount>()
            var shadeSet = Set<CardShade>()
            var colorSet = Set<CardColor>()
            for card in selectedCards {
                shapeSet.insert(card.shape)
                countSet.insert(card.count)
                shadeSet.insert(card.shade)
                colorSet.insert(card.color)
            }
            return shapeSet.count != 2 && countSet.count != 2 && shadeSet.count != 2 && colorSet.count != 2
        }
        return false
    }
    
    var thirdCard: Card? {
        guard selectedCards.count == 2 else {
            return nil
        }
        let shape: CardShape = getCardContent(allCases: Set<CardShape>([.diamond, .oval, .squiggly]),
                                                    presentCases: [selectedCards[0].shape, selectedCards[1].shape])
        let count: CardCount = getCardContent(allCases: Set<CardCount>([.one, .two, .three]),
                                                    presentCases: [selectedCards[0].count, selectedCards[1].count])
        let shade: CardShade = getCardContent(allCases: Set<CardShade>([.open, .solid, .striped]),
                                                    presentCases: [selectedCards[0].shade, selectedCards[1].shade])
        let color: CardColor = getCardContent(allCases: Set<CardColor>([.red, .green, .purple]),
                                                    presentCases: [selectedCards[0].color, selectedCards[1].color])
        return Card(id: hashCard(shape, count, shade, color),
                    shape: shape, count: count, shade: shade, color: color)
    }
    
    func getCardContent<Property>(allCases: Set<Property>, presentCases: [Property]) -> Property {
        var allCases = allCases
        for cases in presentCases {
            allCases.remove(cases)
        }
        if allCases.count == 1 {
            return allCases.first!  // FIXME: - Forced unwrap
        } else {
            return presentCases[0]
        }
    }

    func hashCard(_ shape: Card.CardShape, _ count: Card.CardCount, _ shade: Card.CardShade, _ color: Card.CardColor) -> Int {
        return 1000*shape.rawValue + 100*count.rawValue + 10*shade.rawValue + color.rawValue
    }

    private mutating func removeCardFromDeck(_ card: Card) {
        if let indexToRemove = deckCards.indices.filter( { deckCards[$0].id == card.id } ).first {
            deckCards.remove(at: indexToRemove)
        }
    }

    private mutating func removeCardFromSelectedCards(_ card: Card) {
        if let indexToRemove = selectedCards.indices.filter( { selectedCards[$0].id == card.id } ).first {
            selectedCards.remove(at: indexToRemove)
        }
    }
    
    private mutating func removeCardFromDisplayedCards(_ card: Card) {
        if let indexToRemove = displayedCards.indices.filter( { displayedCards[$0].id == card.id } ).first {
            displayedCards.remove(at: indexToRemove)
        }
    }

    // MARK: - ViewModel Calls

    mutating func selectCard(_ card: Card) {
        if matched {
            for card in selectedCards {
                removeCardFromDisplayedCards(card)
            }
            selectedCards.removeAll()
            dealThreeCards()
        }
        if selectedCards.count == 3 && !matched {
            selectedCards.removeAll()
        }
        if !selectedCards.contains(where: { $0.id == card.id }) {
            selectedCards.append(card)
        } else {
            removeCardFromSelectedCards(card)
        }
    }

    mutating func dealThreeCards() {
        for _ in 0..<min(3, deckCards.count) {
            displayedCards.append(deckCards.removeFirst())
        }
    }

    func cardIsSelected(_ card: Card) -> Bool {
        return selectedCards.contains(where: { $0.id == card.id })
    }
}
