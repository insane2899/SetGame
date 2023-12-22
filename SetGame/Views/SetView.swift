//
//  ContentView.swift
//  SetGame
//
//  Created by Soumik Sen on 19/12/23.
//

import SwiftUI

struct SetView: View {
    typealias Card = SetModel.Card
    @StateObject var viewModel = SetViewModel()
    private let gameTitle: String = "Game of Set"

    var body: some View {
        VStack(spacing: 0) {
            title
            Divider()
            cards
                .font(.largeTitle)
            Spacer()
        }
    }

    var title: some View {
        Text(gameTitle)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.blue)
        
    }

    @ViewBuilder
    var cards: some View {
        AspectVGrid(itemArray: viewModel.displayedCards) { card in
            Cards(content: getCardContent(of: card))
                .padding(5)
                .onTapGesture {
                    // TODO: Implement Tap
                }
        }
    }

    @ViewBuilder
    func getCardContent(of card: Card) -> some View {
        VStack (spacing: 5) {
            ForEach(0 ..< card.count.rawValue) { _ in
                drawShape(card.shape)
            }
        }
    }

    @ViewBuilder
    func drawShape(_ shape: Card.CardShape) -> some View {
        switch shape {
        case .diamond:
            Diamond()
        case .oval:
            Oval()
        case .squiggly:
            Squiggle()
        }
    }
}

#Preview {
    SetView()
}
